Feature: Admin manages submissions
  As an admin
  I want to update submission statuses
  So that the team knows which submissions are approved

  Scenario: Admin updates submission status
    Given there is a citizen submission with title "Fix street lighting"
    And a user exists with email "admin@example.com" and password "password" and admin flag
    When I sign in as "admin@example.com"
    When I visit the admin submissions page
    When I update the status for "Fix street lighting" to "Approved"
    Then the submission titled "Fix street lighting" should have status "approved"
