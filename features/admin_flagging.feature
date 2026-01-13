Feature: Admin flags submissions
  As an admin
  I want to flag and unflag submissions
  So they can be prioritized for follow-up

  Scenario: Admin flags a submission
    Given there is a citizen submission with title "Streetlight outage"
    And a user exists with email "admin3@example.com" and password "password" and admin flag
    When I sign in as "admin3@example.com"
    When I flag the submission titled "Streetlight outage"
    Then the submission titled "Streetlight outage" should be flagged

  Scenario: Admin clears a flag
    Given there is a citizen submission with title "Pothole repair"
    And a user exists with email "admin3@example.com" and password "password" and admin flag
    When I sign in as "admin3@example.com"
    When I flag the submission titled "Pothole repair"
    And I clear the flag for "Pothole repair"
    Then the submission titled "Pothole repair" should not be flagged
