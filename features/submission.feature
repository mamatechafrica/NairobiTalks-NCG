Feature: Submit an idea
  As an authenticated user
  I want to submit an idea
  So that it becomes visible for community voting

  Scenario: Authenticated user submits an idea
    Given a user exists with email "submitter@example.com" and password "password"
    When I sign in as "submitter@example.com"
    When I submit a new submission with title "Plant trees in Park Ave"
    Then I should see "Plant trees in Park Ave"
