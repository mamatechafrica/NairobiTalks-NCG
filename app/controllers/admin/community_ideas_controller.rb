module Admin
  class CommunityIdeasController < Admin::BaseController
    PER_PAGE = 20

    before_action :set_idea, only: [:show, :update, :approve, :reject]

    def index
      @filters = filter_params
      ideas = filter_scope
      @total_count = ideas.count
      @page = [@filters[:page].to_i, 1].max
      @total_pages = (@total_count.to_f / PER_PAGE).ceil
      @page = [@page, (@total_pages.positive? ? @total_pages : 1)].min
      @community_ideas = ideas.offset((@page - 1) * PER_PAGE).limit(PER_PAGE)

      @wards = CommunityIdea.where.not(ward: [nil, ""]).distinct.order(:ward).pluck(:ward)
      @topics = CommunityIdea.where.not(topic: [nil, ""]).distinct.order(:topic).pluck(:topic)
      @statuses = CommunityIdea::STATUSES
    end

    def show
    end

    def update
      if @idea.update(community_idea_params)
        redirect_to admin_community_idea_path(@idea), notice: "Feedback saved."
      else
        render :show, status: :unprocessable_entity
      end
    end

    def approve
      update_status("approved", "Idea approved.")
    end

    def reject
      update_status("rejected", "Idea rejected and flagged for review.")
    end

    private

    def community_idea_params
      params.require(:community_idea).permit(:admin_comment)
    end

    def filter_params
      params.permit(:status, :ward, :topic, :search, :page)
    end

    def filter_scope
      scope = CommunityIdea.all
      scope = scope.with_status(@filters[:status])
      scope = scope.with_ward(@filters[:ward])
      scope = scope.with_topic(@filters[:topic])
      if @filters[:search].present?
        search_term = "%#{@filters[:search]}%"
        scope = scope.where("title ILIKE :q OR description ILIKE :q", q: search_term)
      end
      scope.order(created_at: :desc)
    end

    def set_idea
      @idea = CommunityIdea.find(params[:id])
    end

    def update_status(status, notice_message)
      if @idea.update(status: status)
        redirect_back fallback_location: admin_community_ideas_path, notice: notice_message
      else
        redirect_back fallback_location: admin_community_ideas_path, alert: "Unable to update status."
      end
    end
  end
end
