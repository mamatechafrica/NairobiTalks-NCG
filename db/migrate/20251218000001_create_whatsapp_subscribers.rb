class CreateWhatsappSubscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :whatsapp_subscribers do |t|
      t.string :phone, null: false
      t.boolean :active, default: true, null: false
      t.string :ward
      t.string :topics
      t.string :phone_hash  # Optional: for privacy-preserving analytics

      t.timestamps
    end

    add_index :whatsapp_subscribers, :phone, unique: true
    add_index :whatsapp_subscribers, :active
    add_index :whatsapp_subscribers, :ward
  end
end
