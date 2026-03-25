@availability
Feature: Check Room Availability
  As a user
  User wants to check availability
  So that booking can be planned

  Background:
    Given the booking system is accessible

  @positive
  Scenario Outline: Check availability for valid dates
    Given check-in "<checkin>" and check-out "<checkout>"
    When the user checks availability
    Then the response should contain available room data

  Examples:
    | checkin    | checkout   |
    | 2026-05-01 | 2026-05-03 |
    | 2026-06-10 | 2026-06-15 |
    | 2026-07-01 | 2026-07-02 |

  @negative
  Scenario Outline: Check availability with invalid or edge case dates
    Given check-in "<checkin>" and check-out "<checkout>"
    When the user checks availability
    Then the response body should be "<message>" failing to show available rooms

  Examples:
    | checkin    | checkout   | message                              |
    | 2026-05-10 | 2026-05-08 | must be greater than or equal to 1   |
    |            | 2026-05-10 | must not be null                     |
    | 2026-05-10 |            | must not be null                     |
    | 2024-01-01 | 2024-01-05 | must be greater than or equal to 1   |
    | 2026-05-01 | 2026-05-01 | must be greater than or equal to 1   |