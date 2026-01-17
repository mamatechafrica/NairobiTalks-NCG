class PagesController < ApplicationController
  def landing
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
    # Show the landing page by default. Keep submission object for CTA/form.
    render :landing
  end
end
