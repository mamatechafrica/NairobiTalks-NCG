module Admin
  class TopicsController < Admin::BaseController
    before_action :set_topic, only: %i[ show edit update destroy ]

    def index
      @topics = policy_scope(Topic)
      authorize Topic
    end

    def show
      authorize @topic
    end

    def new
      @topic = Topic.new
      authorize @topic
    end

    def edit
      authorize @topic
    end

    def create
      @topic = Topic.new(topic_params)
      @topic.user = current_user
      authorize @topic
      if @topic.save
        redirect_to "/admin/forum", notice: "Topic was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @topic
      if @topic.update(topic_params)
        redirect_to "/admin/forum", notice: "Topic was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @topic
      @topic.destroy
      redirect_to "/admin/forum", notice: "Topic was successfully deleted."
    end

    private
      def set_topic
        @topic = Topic.find(params[:id])
      end

      def topic_params
        params.require(:topic).permit(:title, :description, :user_id)
      end
  end
end
