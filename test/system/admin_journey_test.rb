require "application_system_test_case"

class AdminJourneyTest < ApplicationSystemTestCase
  setup do
    @admin = User.create!(email: "admin@example.com", password: "password123", admin: true)
    @submission = CitizenSubmission.create!(
      title: "Citizen issue for admin test",
      description: "A test citizen submission",
      location: "Test Ward",
      topic: "Public Health Services",
      status: "submitted"
    )
  end

  test "admin can sign in and update a submission status" do
    visit new_user_session_path

    fill_in "user_email", with: @admin.email
    fill_in "user_password", with: "password123"
    click_button "Sign in"

    assert_text @admin.email

    visit admin_submissions_path(view: "table")

    assert_text @submission.title

    within(:xpath, "//tr[td//strong[contains(text(), '#{@submission.title}')]]") do
      # Toggle flag for the submission and accept confirmation
      accept_confirm do
        click_button "Flag"
      end
    end

    # Verify UI shows the submission as flagged
    assert_text "Flagged"
  end
end
