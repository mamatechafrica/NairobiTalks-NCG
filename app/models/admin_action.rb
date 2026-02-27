class AdminAction < ApplicationRecord
  belongs_to :user

  validates :action, presence: true
  validates :user, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :for_record, ->(record) { where(record_type: record.class.name, record_id: record.id) }

  def self.log!(user, action, record = nil, metadata = {})
    create!(
      user: user,
      action: action.to_s,
      record_type: record&.class&.name,
      record_id: record&.id,
      ip_address: Current&.ip_address,
      user_agent: Current&.user_agent,
      metadata: metadata
    )
  end
end
