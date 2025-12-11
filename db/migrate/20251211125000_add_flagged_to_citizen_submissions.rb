class AddFlaggedToCitizenSubmissions < ActiveRecord::Migration[8.1]
  def change
    add_column :citizen_submissions, :flagged, :boolean, default: false, null: false
  end
end
