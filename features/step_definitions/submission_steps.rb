When("I submit a new submission with title {string}") do |title|
  visit new_submission_path
  # Fill the submission form directly (no tabbed UI anymore)
  within('form') do
    fill_in "Idea Title", with: title
    fill_in "Description", with: "A test submission from Cucumber"
    select "Ward 1", from: 'submission_ward'
    select "Community", from: 'submission_topics'
    click_button "Submit Idea"
  end
end

Then("I should see {string} on the homepage") do |text|
  visit root_path
  expect(page).to have_content(text)
end
