@booking
Feature: Delete Booking
  As a user
  User wants to cancel booking
  So that reservation can be removed

  Background:
    Given user is authenticated
    And booking exists

  @positive
  Scenario: Delete booking successfully
    When the user deletes booking
    Then booking should be removed

  @negative
  Scenario Outline: Delete booking with invalid inputs
    Given booking id "<bookingId>"
    When user deletes booking
    Then deletion should fail
    And message "<message>" should be shown

    Examples:
      | bookingId | message   |
      | -1        | []        |
      | 0         | []        |
      | 9999      | []        |