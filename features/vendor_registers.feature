Feature: Vendor registers

  As a vendor
  I want to register
  So my customers can share their thoughts

  Scenario: Sign up
    Given I am not authenticated
    When I go to the home page
    And I follow "Sign up"
    And I register with email "dave@test.com" and password "secret"
    Then I should be redirected to my control panel 
    And I can login as "dave@test.com" with password "secret"   
   