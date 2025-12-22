class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    redirect_to dashboard_user_path
  end

  def dashboard
    if @user.admin?
      # Admin dashboard - platform-wide statistics
      @total_users = User.count
      @total_ideas = CommunityIdea.count
      @total_comments = Comment.count
      @recent_ideas = CommunityIdea.order(created_at: :desc).limit(5)
      @recent_comments = Comment.order(created_at: :desc).limit(5)
      @recent_activities = (@recent_ideas + @recent_comments).sort_by(&:created_at).reverse.take(10)
    else
      # Citizen dashboard - comprehensive user data
      @user_data = {
        name: @user.email.split('@').first.titleize, # Simple name derivation
        avatar: nil, # Could be added later with user avatar field
        join_date: @user.created_at.strftime('%B %Y'),
        total_ideas: @user.community_ideas.count,
        comments_count: @user.comments.count,
        community_score: calculate_community_score(@user)
      }

      # User's submitted ideas with detailed info
      @submitted_ideas = @user.community_ideas.includes(:comments)
        .order(created_at: :desc)
        .map do |idea|
          {
            id: idea.id,
            title: idea.title,
            status: idea_status(idea),
            upvotes: idea.upvotes,
            downvotes: idea.downvotes,
            comments: idea.comments.count,
            submitted_date: idea.created_at.strftime('%Y-%m-%d'),
            ward: idea.ward,
            topics: idea.topic.present? ? [idea.topic] : [],
            image: nil, # Placeholder for now
            image_alt: "#{idea.title} community idea"
          }
        end

      # Voted ideas
      @voted_ideas = @user.voted_community_ideas.includes(:votes)
      # Recent activity: comments
      @recent_activity = @user.comments.includes(:community_idea)
        .order(created_at: :desc)
        .limit(10)
        .map do |comment|
          {
            id: comment.id,
            idea_title: comment.community_idea.title,
            activity_type: 'comment',
            activity_date: comment.created_at.strftime('%Y-%m-%d'),
            ward: comment.community_idea.ward,
            body: comment.body.truncate(100)
          }
        end

      # Community statistics
      @community_stats = {
        participation_trend: participation_trend_data,
        ward_involvement: ward_involvement_data,
        topic_preferences: topic_preferences_data
      }

      # Filter parameters for future filtering functionality
      @date_filter = params[:date_filter] || 'all'
      @activity_filter = params[:activity_filter] || 'all'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_user_path, notice: 'Profile updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def calculate_community_score(user)
    # Simple scoring algorithm: ideas * 10 + votes * 2 + comments * 5
    (user.community_ideas.count * 10) + (user.votes.count * 2) + (user.comments.count * 5)
  end

  def idea_status(idea)
    # Simple status logic - could be enhanced with actual status field
    days_old = (Time.current - idea.created_at) / 1.day
    if days_old < 7
      'active'
    elsif idea.comments.count > 5 || idea.upvotes > 10
      'implemented'
    else
      'pending'
    end
  end

  def participation_trend_data
    # Last 6 months of user activity (ideas and comments)
    months = []
    6.downto(1) do |i|
      month_start = i.months.ago.beginning_of_month
      month_end = i.months.ago.end_of_month
      ideas = @user.community_ideas.where(created_at: month_start..month_end).count
      comments = @user.comments.where(created_at: month_start..month_end).count
      months << {
        month: month_start.strftime('%b'),
        votes: 0, # No vote tracking
        ideas: ideas,
        comments: comments
      }
    end
    months.reverse
  end

  def ward_involvement_data
    # Count user's activity by ward (ideas and comments)
    ward_counts = {}
    @user.community_ideas.each do |idea|
      ward = idea.ward || 'Unknown'
      ward_counts[ward] ||= 0
      ward_counts[ward] += 1
    end
    @user.comments.each do |comment|
      ward = comment.community_idea.ward || 'Unknown'
      ward_counts[ward] ||= 0
      ward_counts[ward] += 1
    end

    ward_counts.map { |ward, count| { ward: ward, count: count } }.sort_by { |w| -w[:count] }
  end

  def topic_preferences_data
    # Count user's activity by topic
    topic_counts = {}
    @user.community_ideas.each do |idea|
      topic = idea.topic || 'General'
      topic_counts[topic] ||= 0
      topic_counts[topic] += 1
    end
    @user.votes.each do |vote|
      topic = vote.votable.topic || 'General'
      topic_counts[topic] ||= 0
      topic_counts[topic] += 1
    end

    topic_counts.map { |topic, count| { topic: topic, count: count } }.sort_by { |t| -t[:count] }
  end
end
