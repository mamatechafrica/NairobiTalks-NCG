class CommunityIdeasController < ApplicationController
  before_action :set_idea, only: [ :show, :upvote, :downvote ]

  skip_before_action :verify_authenticity_token, only: [ :create_comment ], if: -> { Rails.env.development? }

  def index
    @community_ideas = CommunityIdea.all
    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @community_ideas = @community_ideas.where("title ILIKE :q OR description ILIKE :q", q: search_term)
    end
    if params[:topic].present? && params[:topic] != "All"
      @community_ideas = @community_ideas.where(topic: params[:topic])
    end
    if params[:ward].present? && params[:ward] != "All"
      @community_ideas = @community_ideas.where(ward: params[:ward])
    end
    if params[:status].present? && params[:status] != "All"
      @community_ideas = @community_ideas.where(status: params[:status])
    end
  end

  def show
    @community_idea = CommunityIdea.find(params[:id])
    @comment = Comment.new
  end

  before_action :authenticate_user!, only: [ :upvote, :downvote, :create_comment ]

  def upvote
    vote = Vote.find_or_initialize_by(user: current_user, community_idea: @idea)
    if vote.new_record? || vote.vote_type != "upvote"
      vote.vote_type = "upvote"
      vote.save!
      @idea.increment!(:upvotes) if vote.previous_changes.key?(:id) || vote.vote_type_previously_was == "downvote"
      @idea.decrement!(:downvotes) if vote.vote_type_previously_was == "downvote" && @idea.downvotes > 0
    end
    redirect_back fallback_location: community_ideas_path
  end

  def downvote
    vote = Vote.find_or_initialize_by(user: current_user, community_idea: @idea)
    if vote.new_record? || vote.vote_type != "downvote"
      vote.vote_type = "downvote"
      vote.save!
      @idea.increment!(:downvotes) if vote.previous_changes.key?(:id) || vote.vote_type_previously_was == "upvote"
      @idea.decrement!(:upvotes) if vote.vote_type_previously_was == "upvote" && @idea.upvotes > 0
    end
    redirect_back fallback_location: community_ideas_path
  end

  def create_comment
    @community_idea = CommunityIdea.find(params[:community_idea_id])
    @comment = @community_idea.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      respond_to do |format|
        format.html { redirect_to community_idea_path(@community_idea), notice: "Comment added successfully." }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = "There was an error adding your comment."
          render :show, status: :unprocessable_entity
        end
        format.turbo_stream
      end
    end
  end

  private

  def set_idea
    @idea = CommunityIdea.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
