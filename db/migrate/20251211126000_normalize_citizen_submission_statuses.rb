class NormalizeCitizenSubmissionStatuses < ActiveRecord::Migration[8.1]
  def up
    return unless table_exists?(:citizen_submissions)

    CitizenSubmission.reset_column_information
    status_mapping = {
      "Under Review" => "under_review",
      "Approved" => "approved",
      "Disapproved" => "rejected",
      "Submitted for Funding" => "submitted",
      "Adopted" => "approved",
      "Submitted" => "submitted"
    }

    status_mapping.each do |current, normalized|
      CitizenSubmission.where(status: current).update_all(status: normalized)
    end

    CitizenSubmission.where(status: nil).update_all(status: "submitted")
  end

  def down
    # best-effort reversion is not possible due to data loss; leave as-is
  end
end
