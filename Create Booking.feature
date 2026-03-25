Feature: Create Booking

  Background:
    Given the booking system is available
    And a room is selected

  Scenario: Create booking successfully
    Given valid booking details
    When the user submits booking request
    Then the booking should be created successfully
    And a booking reference should be generated

  Scenario Outline: Create booking with different invalid inputs
    Given <invalid_condition>
    When the user submits booking request
    Then the request should fail

    Examples:
      | invalid_condition                  |
      | missing mandatory fields           |
      | empty input values                 |
      | invalid email format               |
      | excessively long input values      |
      | special characters in input        |
      | booking dates in the past          |

  Scenario: Create booking with overlapping dates
    Given the room is already booked for selected dates
    When the user submits booking request
    Then the request should fail
    And the user should be informed about unavailability