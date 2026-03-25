Feature: Update Booking

  Background:
    Given the booking system is available
    And an existing booking is present

  Scenario: Update booking successfully
    When the user updates booking details
    Then the request should be successful
    And updated details should be reflected

  Scenario Outline: Update booking with different invalid conditions
    Given <invalid_condition>
    When the user updates booking
    Then the request should fail

    Examples:
      | invalid_condition                  |
      | invalid booking id                |
      | empty booking details             |
      | conflicting booking dates         |

  Scenario: Verify updated booking data integrity
    When the booking is updated
    Then the stored data should match updated values