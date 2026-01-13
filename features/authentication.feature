Feature: Authentication
  Users and admins can sign in and access appropriate pages

  Scenario: User signs in via UI
    Given a user exists with email "user1@example.com" and password "password"
    When I sign in via UI as "user1@example.com" with password "password"
    Then I should see "Sign Out"

  Scenario: Admin signs in and accesses admin pages
    Given a user exists with email "admin2@example.com" and password "password" and admin flag
    When I sign in as "admin2@example.com"
    When I visit the admin submissions page
    Then I should see "Citizen Submissions"

  Scenario: Non-admin cannot access admin pages
    Given a user exists with email "user2@example.com" and password "password"
    When I sign in via UI as "user2@example.com" with password "password"
    When I visit the admin submissions page
    Then I should be redirected to the sign in page with message "Please log in as admin."
