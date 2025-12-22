class Comment < ApplicationRecord
  belongs_to :community_idea
  belongs_to :user, optional: true
end
