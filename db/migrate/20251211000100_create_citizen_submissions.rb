class CreateCitizenSubmissions < ActiveRecord::Migration[8.1]
  def change
    create_table :citizen_submissions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :location
      t.string :topic
      t.string :citizen_contact
      t.string :anonymity
      t.string :status, null: false, default: "Under Review"
      t.text :admin_comment

      t.timestamps
    end
  end
end
