When("I submit a new submission with title {string}") do |title|
  visit new_submission_path
  # Activate the Submit Idea tab (form is in a tab-pane)
  find('button#form-tab').click
  within('#form') do
    fill_in "Idea Title", with: title
    fill_in "Description", with: "A test submission from Cucumber"
    # The form uses `submission_ward` (select) but controller expects `location` and `topic` params.
    # Fill both to satisfy validations used by controller.
    select "Ward 1", from: 'submission_ward'
    # Choose a topic from the topics multi-select
    select "Community", from: 'submission_topics'
    click_button "Submit Idea"
  end
end

Then("I should see {string} on the homepage") do |text|
  visit root_path
  expect(page).to have_content(text)
end
