class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community_idea, null: false, foreign_key: true
      t.string :vote_type, null: false # 'upvote' or 'downvote'
      t.timestamps
    end
    add_index :votes, [:user_id, :community_idea_id], unique: true
  end
end
