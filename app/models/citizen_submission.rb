class CitizenSubmission < ApplicationRecord
  enum :status, {
    submitted: "submitted",
    under_review: "under_review",
    reviewed: "reviewed",
    approved: "approved",
    rejected: "rejected"
  }

  STATUS_LABELS = {
    submitted: "Submitted",
    under_review: "Under Review",
    reviewed: "Reviewed",
    approved: "Approved",
    rejected: "Rejected"
  }.freeze

  REVIEW_STEPS = STATUS_LABELS.values.freeze

  STATUS_OPTIONS = STATUS_LABELS.map { |key, label| [label, key.to_s] }.freeze

  has_one_attached :image

  validates :title, :description, :location, :topic, :status, presence: true

  def status_label
    STATUS_LABELS[status.to_sym] || status.to_s.humanize
  end

  def net_status_position
    REVIEW_STEPS.index(status_label) || 0
  end
end
