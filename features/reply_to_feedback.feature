Feature: Reply to feedback

  As a vendor
  I want to reply to my customers feedback
  So that I can deal with their concerns and build a relationship

  Scenario: Reply to email feedback
    Given I am a vendor        
    And I have a venue "The White Elephant"
    And "The White Elephant" has feedback "boo!" from "local@h-o-b.co.uk"
    And I am on the feedback page for "The White Elephant"
    When I enter a reply "hoo"
    And press the reply button 
    Then an email should be sent to "local@h-o-b.co.uk" containing "hoo"