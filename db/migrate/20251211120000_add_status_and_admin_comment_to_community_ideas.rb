class AddStatusAndAdminCommentToCommunityIdeas < ActiveRecord::Migration[8.1]
  def change
    add_column :community_ideas, :status, :string, null: false, default: "pending"
    add_column :community_ideas, :admin_comment, :text
  end
end
