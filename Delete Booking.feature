Feature: Delete Booking

  Background:
    Given the booking system is available
    And an existing booking is present

  Scenario: Delete booking successfully
    When the user deletes the booking
    Then the request should be successful
    And the booking should be removed

  Scenario Outline: Delete booking with different conditions
    Given <delete_condition>
    When the user deletes booking
    Then the request should fail

    Examples:
      | delete_condition            |
      | already deleted booking     |
      | invalid booking id          |

  Scenario: Verify booking removal
    When the booking is deleted
    Then the booking should no longer be retrievable