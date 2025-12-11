class CommunityIdea < ApplicationRecord
	STATUSES = {
		pending: "Pending review",
		approved: "Approved",
		rejected: "Rejected"
	}.freeze

	scope :with_status, ->(status) {
		return all unless status.present?

		where(status: status)
	}
	scope :with_ward, ->(ward) {
		return all unless ward.present?

		where(ward: ward)
	}
	scope :with_topic, ->(topic) {
		return all unless topic.present?

		where(topic: topic)
	}

	before_validation :set_default_status, on: :create

	validates :status, inclusion: { in: STATUSES.keys.map(&:to_s) }

	def net_score
		upvotes.to_i - downvotes.to_i
	end

	private

	def set_default_status
		self.status = "pending" if status.blank?
	end
end
