@booking
Feature: Update Booking
  As a user
  User wants to modify booking
  So that changes can be applied

  Background:
    Given user is authenticated
    And booking exists

  @positive
  Scenario: Update booking successfully
    When the user updates booking details
    Then booking should be updated

  @negative
  Scenario Outline: Update booking with invalid inputs
    Given booking id "<bookingId>"
    When user updates booking with invalid data
    Then update should fail
    And message "<message>"

    Examples:
      | bookingId | message |
      | -1        | []      |
      | 0         | []      |
      | 9999      | []      |
      | 1         | []      |