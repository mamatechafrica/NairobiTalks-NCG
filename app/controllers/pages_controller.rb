class PagesController < ApplicationController
  def landing
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
    # Temporary preview: allow visiting /landing?preview=landing to view the
    # `app/views/pages/landing.html.erb` template without changing routes.
    if params[:preview] == "landing"
      render :landing
    else
      render "submissions/new"
    end
  end
end
