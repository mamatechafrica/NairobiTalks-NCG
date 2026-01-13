Feature: Admin adds notes to submissions
  As an admin
  I want to add admin notes to submissions
  So other admins can see context and decisions

  Scenario: Admin saves an admin note
    Given there is a citizen submission with title "Fix park bench"
    And a user exists with email "admin4@example.com" and password "password" and admin flag
    When I sign in as "admin4@example.com"
    When I add an admin note "Checked and approved" to "Fix park bench"
    Then the submission titled "Fix park bench" should have admin note "Checked and approved"
