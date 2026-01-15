class IdeasExplorerController < ApplicationController
  def index
    @ideas = CommunityIdea.all
    @ideas = @ideas.where("title LIKE ?", "%#{params[:query]}%") if params[:query].present?
    @ideas = @ideas.where(ward: params[:ward]) if params[:ward].present?
    @ideas = @ideas.where(topic: params[:topic]) if params[:topic].present?
    @ideas = @ideas.order(created_at: :desc) if params[:sort] == "recent"
    @ideas = @ideas.order(votes_count: :desc) if params[:sort] == "popular"
  end
end
