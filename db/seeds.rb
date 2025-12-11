# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed sample community ideas
TOPICS = %w[Health Education Environment Infrastructure Security].freeze
ward_names = WARD_LIST.map { |w| w[:name] }

25.times do |i|
  topic = TOPICS[i % TOPICS.size]
  ward = ward_names[i % ward_names.size]
  status = CommunityIdea::STATUSES.keys[i % CommunityIdea::STATUSES.size].to_s

  CommunityIdea.find_or_create_by!(title: "Idea ##{i + 1}") do |idea|
    idea.description = "Community-driven project to improve #{topic} in #{ward}."
    idea.ward = ward
    idea.topic = topic
    idea.upvotes = rand(0..50)
    idea.downvotes = rand(0..10)
    idea.status = status
  end
end

# Create admin user
User.find_or_create_by!(email: "naijeria@gmail.com") do |user|
  user.password = "securepassword"
  user.password_confirmation = "securepassword"
  user.admin = true
end

puts "Admin user created: naijeria@gmail.com"

# Seed sample citizen submissions so the admin panel has content
submission_topics = TOPICS
submission_statuses = CitizenSubmission.statuses.keys
10.times do |i|
  title = "Citizen Submission ##{i + 1}"
  status = submission_statuses[i % submission_statuses.size]
  ward = ward_names[i % ward_names.size]
  topic = submission_topics[(i + 2) % submission_topics.size]

  CitizenSubmission.find_or_create_by!(title: title) do |submission|
    submission.description = "Community idea from #{ward} to improve #{topic} services across the ward."
    submission.location = ward
    submission.topic = topic
    submission.anonymity = i.even? ? "Anonymous" : "Share my contact"
    submission.citizen_contact = i.even? ? nil : "citizen#{i + 1}@example.com"
    submission.status = status
    submission.flagged = (i % 4).zero?
  end
end

# Seed sample community submissions (commented out as Submission is not persisted to DB)
# ward_names = WARD_LIST.map { |w| w[:name] }
# topics = ["Health", "Education", "Environment", "Infrastructure", "Security"]
#
# 25.times do |i|
#   Submission.create!(
#     title: "Community Idea ##{i + 1}",
#     description: "A community-driven project to improve #{topics[i % topics.size]} services in #{ward_names[i % ward_names.size]}.",
#     location: ward_names[i % ward_names.size],
#     topic: topics[i % topics.size],
#     anonymous: [true, false].sample
#   )
# end
