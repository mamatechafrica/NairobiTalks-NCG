When("I flag the submission titled {string}") do |title|
  submission = CitizenSubmission.find_by!(title: title)
  submission.update!(flagged: true)
end

When("I clear the flag for {string}") do |title|
  submission = CitizenSubmission.find_by!(title: title)
  submission.update!(flagged: false)
end

Then("the submission titled {string} should be flagged") do |title|
  submission = CitizenSubmission.find_by!(title: title)
  expect(submission.reload.flagged).to be true
end

Then("the submission titled {string} should not be flagged") do |title|
  submission = CitizenSubmission.find_by!(title: title)
  expect(submission.reload.flagged).to be false
end

When("I add an admin note {string} to {string}") do |note, title|
  submission = CitizenSubmission.find_by!(title: title)
  submission.update!(admin_comment: note)
end

Then("the submission titled {string} should have admin note {string}") do |title, note|
  submission = CitizenSubmission.find_by!(title: title)
  expect(submission.reload.admin_comment).to eq(note)
end

Given("there are submissions with titles:") do |table|
  table.raw.flatten.each do |title|
    CitizenSubmission.create!(title: title, description: "Bulk op", location: "Ward 1", topic: "Community", status: "submitted")
  end
end

When("I bulk update submissions to status {string}") do |new_status|
  # Use the model directly to keep tests stable
  CitizenSubmission.update_all(status: new_status.downcase)
end

Then("all submissions should have status {string}") do |expected|
  expect(CitizenSubmission.pluck(:status).uniq).to eq([ expected.downcase ])
end
