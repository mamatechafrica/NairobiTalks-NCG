class SetDefaultCitizenSubmissionStatus < ActiveRecord::Migration[8.1]
  def change
    change_column_default :citizen_submissions, :status, "submitted"
  end
end
