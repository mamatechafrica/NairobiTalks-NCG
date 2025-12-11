class Admin::AnalyticsController < Admin::BaseController
  def index
    @total_ideas = CommunityIdea.count
    @total_upvotes = CommunityIdea.sum(:upvotes)
    @total_downvotes = CommunityIdea.sum(:downvotes)
    @avg_upvotes = (@total_upvotes.to_f / @total_ideas).round(2) rescue 0
    @avg_downvotes = (@total_downvotes.to_f / @total_ideas).round(2) rescue 0

    @top_ideas = CommunityIdea.all.sort_by { |i| i.upvotes - i.downvotes }.reverse.first(10)
    @ward_counts = CommunityIdea.group(:ward).count
    @topic_counts = CommunityIdea.group(:topic).count
  end
end
