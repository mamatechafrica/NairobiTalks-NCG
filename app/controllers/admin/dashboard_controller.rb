class Admin::DashboardController < Admin::BaseController
  def index
    @total_ideas = CommunityIdea.count
    @total_documents = PlanningDocument.count
    @total_votes = CommunityIdea.sum(:upvotes) + CommunityIdea.sum(:downvotes)
    @recent_ideas = CommunityIdea.order(created_at: :desc).limit(4)
    @recent_documents = PlanningDocument.order(created_at: :desc).limit(5)
    @submission_status_counts = CitizenSubmission.group(:status).count
    @flagged_submissions_count = CitizenSubmission.where(flagged: true).count
  end
end
