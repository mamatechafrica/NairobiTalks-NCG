class CreateSubmissions < ActiveRecord::Migration[8.1]
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :topic
      t.string :anonymity
      t.string :citizen_contact
      t.string :other_topic
      t.boolean :is_anonymous
      t.string :ward

      t.timestamps
    end
  end
end
