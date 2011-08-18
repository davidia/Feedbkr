Feature: Leave web feedback

  As a customer at a venue
  I want to leave feedback
  So I can make my views known to the management

  Scenario: Users leaves web feedback
    Given there is a venue called "Lulu's"
    And I am on the web feedback page for "Lulu's"
    When I enter feedback "Lulu's is my favourite place!" as "customer@ideas.com"
    Then "Lulu's" should have feedback "Lulu's is my favourite place!" from "customer@ideas.com"