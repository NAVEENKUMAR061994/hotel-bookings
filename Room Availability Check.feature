Feature: Room Availability Check

  Background:
    Given the booking system is available

  Scenario Outline: Check availability with different date combinations
    Given <date_condition>
    When the user checks room availability
    Then the <outcome> should be observed

    Examples:
      | date_condition                          | outcome                        |
      | valid check-in and check-out dates      | request should be successful   |
      | invalid date format                     | request should fail            |
      | check-in date in the past               | request should fail            |
      | same check-in and check-out date        | system should handle appropriately |
      | checkout before check-in                | request should fail            |