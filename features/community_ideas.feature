Feature: View community ideas
  As a visitor
  I want to see community ideas listed
  So that I can explore existing suggestions

  Scenario: Visitor views the community ideas index
    Given there is a community idea titled "Fix potholes on main street"
    When I visit the community ideas page
    Then I should see "Fix potholes on main street"

  Scenario: Visitor sees sign-in CTA on idea page
    Given there is a community idea titled "Fix potholes on main street"
    When I visit the community idea page for "Fix potholes on main street"
    Then I should see "Sign in to participate"
    And I should see "Sign in"
