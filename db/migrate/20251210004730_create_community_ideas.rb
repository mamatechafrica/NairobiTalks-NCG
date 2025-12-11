class CreateCommunityIdeas < ActiveRecord::Migration[8.1]
  def change
    create_table :community_ideas do |t|
      t.string :title
      t.text :description
      t.string :ward
      t.string :topic
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps
    end
  end
end
