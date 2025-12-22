class AddWardIdToBroadcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :broadcasts, :ward_id, :integer, null: true
    add_foreign_key :broadcasts, :wards, column: :ward_id
  end
end