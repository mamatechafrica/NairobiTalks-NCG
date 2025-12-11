require 'csv'

namespace :data do
  desc "Export community ideas to CSV"
  task export_ideas: :environment do
    file_path = Rails.root.join('tmp', 'community_ideas.csv')

    CSV.open(file_path, 'w') do |csv|
      # Add headers
      csv << ['Title', 'Description', 'Ward', 'Topic', 'Upvotes', 'Downvotes', 'Popularity Score', 'Created At']

      # Add data
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

    puts "Exported #{CommunityIdea.count} ideas to #{file_path}"
  end

  desc "Generate basic analytics report"
  task analytics: :environment do
    total_ideas = CommunityIdea.count
    total_upvotes = CommunityIdea.sum(:upvotes)
    total_downvotes = CommunityIdea.sum(:downvotes)

    puts "=== Community Ideas Analytics ==="
    puts "Total Ideas: #{total_ideas}"
    puts "Total Upvotes: #{total_upvotes}"
    puts "Total Downvotes: #{total_downvotes}"
    puts "Average Upvotes per Idea: #{(total_upvotes.to_f / total_ideas).round(2)}"
    puts "Average Downvotes per Idea: #{(total_downvotes.to_f / total_ideas).round(2)}"

    puts "\n=== Top Ideas by Popularity ==="
    CommunityIdea.all.sort_by { |i| i.upvotes - i.downvotes }.reverse.first(5).each do |idea|
      puts "#{idea.title}: #{idea.upvotes - idea.downvotes} points"
    end

    puts "\n=== Ideas by Ward ==="
    ward_counts = CommunityIdea.group(:ward).count
    ward_counts.each { |ward, count| puts "#{ward}: #{count} ideas" }

    puts "\n=== Ideas by Topic ==="
    topic_counts = CommunityIdea.group(:topic).count
    topic_counts.each { |topic, count| puts "#{topic}: #{count} ideas" }
  end
end