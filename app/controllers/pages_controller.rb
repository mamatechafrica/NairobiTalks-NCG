class PagesController < ApplicationController
  def landing
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
    render 'submissions/new'
  end
end