Feature: Review feedback

  As a vendor
  I want to read my venue's feedback
  So I can know what my customers think

  Scenario: Read some feedback
    Given I am a vendor
    And I have a venue "super chippy"
    And "super chippy" has feedback "your chips are soggy" from "me@droopster.co.uk"
    When I go to the feedback page for "super chippy"
    Then I should see the feedback "your chips are soggy" from "me@droopster.co.uk"