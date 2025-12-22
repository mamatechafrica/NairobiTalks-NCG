# This migration creates the wards table with name and constituency columns.
class CreateWards < ActiveRecord::Migration[6.0]
  def change
    create_table :wards do |t|
      t.string :name, null: false
      t.string :constituency, null: false

      t.timestamps
    end
  end
end
