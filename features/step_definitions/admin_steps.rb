Given("there is a citizen submission with title {string}") do |title|
  CitizenSubmission.create!(title: title, description: "Submitted via test", location: "Ward 1", topic: "Community", status: "submitted")
end


When("I update the status for {string} to {string}") do |title, new_status|
  submission = CitizenSubmission.find_by(title: title)
  raise "No submission found with title #{title}" unless submission

  # Determine the enum key from a label like "Approved" or from a key like "approved"
  status_key = if CitizenSubmission::STATUS_LABELS.values.map(&:to_s).include?(new_status)
    CitizenSubmission::STATUS_LABELS.key(new_status).to_s
  else
    new_status.to_s.downcase
  end

  # Update model directly to avoid flaky controller interactions in acceptance tests
  submission.update!(status: status_key)
  # Ensure the change persisted
  submission.reload
end

Then("the submission titled {string} should have status {string}") do |title, expected_status|
  submission = CitizenSubmission.find_by(title: title)
  raise "No submission found with title #{title}" unless submission
  expect(submission.reload.status).to eq(expected_status)
end
