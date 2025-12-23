class CommentsController < ApplicationController
  before_action :set_community_idea
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def create
    @comment = @community_idea.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to community_idea_path(@community_idea), notice: "Comment posted."
    else
      render "community_ideas/show", status: :unprocessable_entity
    end
  end

  def edit
    render "community_ideas/_comment_form", locals: { community_idea: @community_idea, comment: @comment }
  end

  def update
    if @comment.update(comment_params)
      redirect_to community_idea_path(@community_idea), notice: "Comment updated."
    else
      render "community_ideas/_comment_form", locals: { community_idea: @community_idea, comment: @comment }
    end
  end

  def destroy
    @comment.destroy
    redirect_to community_idea_path(@community_idea), notice: "Comment deleted."
  end

  private

  def set_community_idea
    @community_idea = CommunityIdea.find(params[:community_idea_id])
  end

  def set_comment
    @comment = @community_idea.comments.find(params[:id])
  end

  def authorize_user!
    redirect_to community_idea_path(@community_idea), alert: "Not authorized." unless @comment.user == current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
