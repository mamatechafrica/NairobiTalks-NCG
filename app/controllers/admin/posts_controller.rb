module Admin
  class PostsController < Admin::BaseController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
      @posts = policy_scope(Post)
      authorize Post
    end

    def show
      authorize @post
    end

    def new
      @post = Post.new
      authorize @post
    end

    def edit
      authorize @post
    end

    def create
      @post = Post.new(post_params)
      authorize @post
      # ...existing code...
    end

    def update
      authorize @post
      # ...existing code...
    end

    def destroy
      authorize @post
      # ...existing code...
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:body, :topic_id, :user_id)
      end
  end
end
