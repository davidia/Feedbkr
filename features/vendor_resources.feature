Feature: Vendor gets resources for their venue

  As a vendor
  I want to get a QR code that links to my feedback page
  So my customers can get to my venues feedback page
  

  Scenario: Read some feedback
    Given I am a vendor
    And I have a venue "super chippy"
    When I go to the venue page for "super chippy"
    Then I should see the QR code