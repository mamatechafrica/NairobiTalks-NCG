class Admin::DashboardController < Admin::BaseController
  def index
    @total_ideas = CommunityIdea.count
    @total_documents = PlanningDocument.count
    @total_votes = CommunityIdea.sum(:upvotes) + CommunityIdea.sum(:downvotes)
    @recent_ideas = CommunityIdea.order(created_at: :desc).limit(4)
    @recent_documents = PlanningDocument.order(created_at: :desc).limit(5)
    @submission_status_counts = CitizenSubmission.group(:status).count
    @flagged_submissions_count = CitizenSubmission.where(flagged: true).count

    # Added data for system status
    @database_status = ActiveRecord::Base.connection.active? ? 'Operational' : 'Down'
    @file_storage_status = File.exist?(Rails.root.join('storage')) ? 'Active' : 'Unavailable'
    @api_status = check_api_status
  end

  private

  def check_api_status
    # Simulated API status check
    response = Net::HTTP.get_response(URI('https://api.example.com/status'))
    response.is_a?(Net::HTTPSuccess) ? 'Running' : 'Unavailable'
  rescue StandardError
    'Unavailable'
  end
end
