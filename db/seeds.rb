# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Ensure WARD_LIST is defined for seeding
WARD_LIST = [
  { name: "Huruma" },
  { name: "Kayole" },
  { name: "Kibera" },
  { name: "Mathare" },
  { name: "Dandora" }
] unless defined?(WARD_LIST)

# Seed sample community ideas
TOPICS = %w[Health Education Environment Infrastructure Security].freeze
ward_names = WARD_LIST.map { |w| w[:name] }

ideas = [
  { title: "Build a playground in Huruma", description: "A safe space for children to play.", ward: "Huruma", topic: "Infrastructure" },
  { title: "Solar lights for security in Kayole", description: "Improve safety with solar-powered streetlights.", ward: "Kayole", topic: "Security" },
  { title: "Clean water project in Kibera", description: "Provide clean and safe drinking water.", ward: "Kibera", topic: "Health" },
  { title: "Tree planting in Mathare", description: "Increase green cover and reduce pollution.", ward: "Mathare", topic: "Environment" },
  { title: "Free tutoring for students in Dandora", description: "Help students excel academically.", ward: "Dandora", topic: "Education" }
]

ideas.each do |idea|
  CommunityIdea.find_or_create_by!(title: idea[:title]) do |ci|
    ci.description = idea[:description]
    ci.ward = idea[:ward]
    ci.topic = idea[:topic]
    ci.upvotes = rand(0..50)
    ci.downvotes = rand(0..10)
    ci.status = "approved"
  end
end

# Create admin user
admin = User.find_or_create_by!(email: "admin@nairobi.gov") do |user|
  user.password = "admin123"
  user.password_confirmation = "admin123"
  user.admin = true
  user.username = "admin"
end

# Create resident user for testing
resident = User.find_or_create_by!(email: "resident@nairobi.gov") do |user|
  user.password = "resident123"
  user.password_confirmation = "resident123"
  user.admin = false
  user.username = "resident"
end

puts "=== Prototype Test Users Created ==="
puts "Admin: admin@nairobi.gov / admin123"
puts "Resident: resident@nairobi.gov / resident123"
puts "================================="

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

# Seed the database with the provided ward list.
Ward.create([
  { name: "Kitisuru", constituency: "Westlands" },
  { name: "Parklands/Highridge", constituency: "Westlands" },
  { name: "Karura", constituency: "Westlands" },
  { name: "Kangemi", constituency: "Westlands" },
  { name: "Mountain View", constituency: "Westlands" },
  { name: "Kilimani", constituency: "Dagoretti North" },
  { name: "Kawangware", constituency: "Dagoretti North" },
  { name: "Gatina", constituency: "Dagoretti North" },
  { name: "Kileleshwa", constituency: "Dagoretti North" },
  { name: "Kabiro", constituency: "Dagoretti North" },
  { name: "Mutu-ini", constituency: "Dagoretti South" },
  { name: "Ngando", constituency: "Dagoretti South" },
  { name: "Riruta", constituency: "Dagoretti South" },
  { name: "Uthiru/Ruthimitu", constituency: "Dagoretti South" },
  { name: "Waithaka", constituency: "Dagoretti South" },
  { name: "Karen", constituency: "Langata" },
  { name: "Nairobi West", constituency: "Langata" },
  { name: "Mugumo-ini", constituency: "Langata" },
  { name: "South C", constituency: "Langata" },
  { name: "Nyayo Highrise", constituency: "Langata" },
  { name: "Laini Saba", constituency: "Kibra" },
  { name: "Lindi", constituency: "Kibra" },
  { name: "Makina", constituency: "Kibra" },
  { name: "Woodley/Kenyatta Golf Course", constituency: "Kibra" },
  { name: "Sarang’ombe", constituency: "Kibra" },
  { name: "Githurai", constituency: "Roysambu" },
  { name: "Kahawa West", constituency: "Roysambu" },
  { name: "Zimmerman", constituency: "Roysambu" },
  { name: "Roysambu", constituency: "Roysambu" },
  { name: "Kahawa", constituency: "Roysambu" },
  { name: "Clay City", constituency: "Kasarani" },
  { name: "Mwiki", constituency: "Kasarani" },
  { name: "Kasarani", constituency: "Kasarani" },
  { name: "Njiru", constituency: "Kasarani" },
  { name: "Ruai", constituency: "Kasarani" },
  { name: "Babadogo", constituency: "Ruaraka" },
  { name: "Utalii", constituency: "Ruaraka" },
  { name: "Mathare North", constituency: "Ruaraka" },
  { name: "Lucky Summer", constituency: "Ruaraka" },
  { name: "Korogocho", constituency: "Ruaraka" },
  { name: "Imara Daima", constituency: "Embakasi South" },
  { name: "Kwa Njenga", constituency: "Embakasi South" },
  { name: "Kwa Reuben", constituency: "Embakasi South" },
  { name: "Pipeline", constituency: "Embakasi South" },
  { name: "Kware", constituency: "Embakasi South" },
  { name: "Kariobangi North", constituency: "Embakasi North" },
  { name: "Dandora Area I", constituency: "Embakasi North" },
  { name: "Dandora Area II", constituency: "Embakasi North" },
  { name: "Dandora Area III", constituency: "Embakasi North" },
  { name: "Dandora Area IV", constituency: "Embakasi North" },
  { name: "Kayole North", constituency: "Embakasi Central" },
  { name: "Kayole Central", constituency: "Embakasi Central" },
  { name: "Kayole South", constituency: "Embakasi Central" },
  { name: "Komarock", constituency: "Embakasi Central" },
  { name: "Matopeni/Spring Valley", constituency: "Embakasi Central" },
  { name: "Upper Savanna", constituency: "Embakasi East" },
  { name: "Lower Savanna", constituency: "Embakasi East" },
  { name: "Embakasi", constituency: "Embakasi East" },
  { name: "Utawala", constituency: "Embakasi East" },
  { name: "Mihango", constituency: "Embakasi East" },
  { name: "Umoja I", constituency: "Embakasi West" },
  { name: "Umoja II", constituency: "Embakasi West" },
  { name: "Mowlem", constituency: "Embakasi West" },
  { name: "Kariobangi South", constituency: "Embakasi West" },
  { name: "Maringo/Hamza", constituency: "Embakasi West" },
  { name: "Viwandani", constituency: "Makadara" },
  { name: "Harambee", constituency: "Makadara" },
  { name: "Makongeni", constituency: "Makadara" },
  { name: "Pumwani", constituency: "Makadara" },
  { name: "Eastleigh North", constituency: "Makadara" },
  { name: "Eastleigh South", constituency: "Kamukunji" },
  { name: "Airbase", constituency: "Kamukunji" },
  { name: "California", constituency: "Kamukunji" },
  { name: "Ngara", constituency: "Kamukunji" },
  { name: "Nairobi Central", constituency: "Kamukunji" },
  { name: "Pangani", constituency: "Starehe" },
  { name: "Ziwani/Kariokor", constituency: "Starehe" },
  { name: "Landimawe", constituency: "Starehe" },
  { name: "Nairobi South", constituency: "Starehe" },
  { name: "Hospital", constituency: "Starehe" },
  { name: "Mabatini", constituency: "Mathare" },
  { name: "Huruma", constituency: "Mathare" },
  { name: "Ngei", constituency: "Mathare" },
  { name: "Mlango Kubwa", constituency: "Mathare" },
  { name: "Kiamaiko", constituency: "Mathare" }
])

Broadcast.create!(title: "Email Broadcast", message: "This is an email broadcast.", delivery_method: :email, ward_id: Ward.first.id)
Broadcast.create!(title: "SMS Broadcast", message: "This is an SMS broadcast.", delivery_method: :sms, ward_id: Ward.first.id)
Broadcast.create!(title: "In-App Broadcast", message: "This is an in-app broadcast.", delivery_method: :in_app, ward_id: Ward.first.id)
