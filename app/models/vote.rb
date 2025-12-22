class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :community_idea
  validates :vote_type, inclusion: { in: %w[upvote downvote] }
  validates :user_id, uniqueness: { scope: :community_idea_id }
end
