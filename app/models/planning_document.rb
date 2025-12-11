class PlanningDocument < ApplicationRecord
  has_one_attached :file
  validates :title, :document_type, :status, :start_year, presence: true
  validates :end_year, presence: true, if: -> { document_type == 'CIDP' }

  enum :status, { draft: 0, approved: 1 }
end
