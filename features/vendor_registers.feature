Feature: Vendor registers

  As a vendor
  I want to register
  So my customers can share their thoughts

  Scenario: Sign up
    Given I am not authenticated
    When I go to the home page
    And I click on "Sign Up"
    And I register with email "dave@test.com" and password "secret"
    Then there should be a user with email "dave@test.com" and password "secret"
    And I should be redirected to my control panel
   