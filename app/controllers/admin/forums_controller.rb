class Admin::ForumsController < Admin::BaseController
  def index
    @topics = policy_scope(Topic)
  end
end
