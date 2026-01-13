Feature: CSRF helper
  Verify that the CSRF helper can submit POST requests that require authenticity tokens.

  Scenario: Submit a POST with a valid CSRF token
    When I visit the homepage
    When I submit a POST to "/cucumber_test/csrf_echo" with params:
      | foo | bar |
    Then I should see "OK"
