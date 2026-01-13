Given("there is a community idea titled {string}") do |title|
  CommunityIdea.create!(title: title, description: "Testing via Cucumber")
end

When("I visit the community ideas page") do
  visit community_ideas_path
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end
