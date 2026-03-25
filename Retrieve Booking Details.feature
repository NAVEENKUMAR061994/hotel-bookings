@booking
Feature: Retrieve Booking Details
  As a user
  User wants to view booking details
  So that reservation can be verified

  Background:
    Given the booking system is accessible

  @positive
  Scenario Outline: Retrieve valid booking
    Given booking id "<bookingId>"
    When the user requests booking details
    Then booking information should be returned

    Examples:
      | bookingId |
      | 1         |
      | 2         |

  @negative
  Scenario Outline: Retrieve invalid booking
    Given booking id "<bookingId>"
    When the user requests booking details
    Then booking should not be returned
    And message "<message>" should be shown

    Examples:
      | bookingId | message|
      | -1        | []     |
      | 0         | []     |
      | abc       | []     |
      | 9999      | []     |