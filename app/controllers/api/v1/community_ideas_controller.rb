class Api::V1::CommunityIdeasController < Api::V1::BaseController
  def index
    community_ideas = CommunityIdea.all
    render json: community_ideas
  end

  def show
    community_idea = CommunityIdea.find(params[:id])
    render json: community_idea
  end
end