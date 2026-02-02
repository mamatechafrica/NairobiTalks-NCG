class CreateAdminActions < ActiveRecord::Migration[8.1]
  def change
    create_table :admin_actions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.string :record_type
      t.integer :record_id
      t.string :ip_address
      t.text :user_agent
      t.json :metadata

      t.timestamps
    end
  end
end
