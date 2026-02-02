class PagesController < ApplicationController
  def landing
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
    # Temporary preview: allow visiting /landing?preview=landing to view the
    # `app/views/pages/landing.html.erb` template without changing routes.
    # Show the landing template by default. Use ?preview=submission to preview the
    # submissions form when needed.
    if params[:preview] == "submission"
      render "submissions/new"
    else
      render :landing
    end
  end
end
