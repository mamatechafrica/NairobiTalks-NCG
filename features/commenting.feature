Feature: Comment on an idea
  As a signed-in user
  I want to post a comment on a community idea
  So that I can participate in discussion

  Scenario: Signed-in user posts a comment
    Given there is a community idea titled "Repair community center roof"
    And a user exists with email "commenter@example.com" and password "password"
    When I sign in as "commenter@example.com"
    When I visit the community idea page for "Repair community center roof"
    And I post a comment "Looks great, when will this happen?"
    Then I should see "Looks great, when will this happen?"
