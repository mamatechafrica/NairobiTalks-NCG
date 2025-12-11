class CommunityIdeasController < ApplicationController

  def index
    @community_ideas = CommunityIdea.all.sort_by { |idea| idea.upvotes - idea.downvotes }.reverse
  end

  def upvote
    idea = CommunityIdea.find(params[:id])
    idea.increment!(:upvotes)
    redirect_back fallback_location: community_ideas_path
  end

  def downvote
    idea = CommunityIdea.find(params[:id])
    idea.increment!(:downvotes)
    redirect_back fallback_location: community_ideas_path
  end
end
