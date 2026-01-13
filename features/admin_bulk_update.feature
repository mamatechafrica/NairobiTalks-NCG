Feature: Admin bulk updates
  As an admin
  I want to update many submissions at once
  So I can efficiently change statuses or add notes

  Scenario: Admin bulk approve submissions
    Given there are submissions with titles:
      | Fix A |
      | Fix B |
    And a user exists with email "admin5@example.com" and password "password" and admin flag
    When I sign in as "admin5@example.com"
    When I bulk update submissions to status "approved"
    Then all submissions should have status "approved"
