
Feature: Create Venue

  As a vedor
  I want to create a venue
  So that customers at that venue can give me feedback

  Scenario: Create a venue
    Given I am a vendor
    When I create a venue named "Dave's Bar"
    Then I should have a venue named "Dave's Bar"