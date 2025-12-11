class DataController < ApplicationController
  before_action :authorize_admin!

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized." unless current_user&.admin?
  end

  def export_ideas
    require 'csv'

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ['Title', 'Description', 'Ward', 'Topic', 'Upvotes', 'Downvotes', 'Popularity Score', 'Created At']

      CommunityIdea.all.each do |idea|
        csv << [
          idea.title,
          idea.description,
          idea.ward,
          idea.topic,
          idea.upvotes,
          idea.downvotes,
          idea.upvotes - idea.downvotes,
          idea.created_at.strftime('%Y-%m-%d %H:%M:%S')
        ]
      end
    end

    send_data csv_data, filename: "community_ideas_#{Date.today}.csv", type: 'text/csv'
  end

  def analytics
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
