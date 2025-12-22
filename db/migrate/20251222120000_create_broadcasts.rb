class CreateBroadcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :broadcasts do |t|
      t.string :title, null: false
      t.text :message, null: false
      t.string :target_audience, null: false

      t.timestamps
    end
  end
end