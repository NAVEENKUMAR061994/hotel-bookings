Feature: Retrieve Booking Details

  Background:
    Given the booking system is available

  Scenario Outline: Retrieve bookings with different room conditions
    Given a <room_condition>
    When the user retrieves booking details
    Then the <outcome> should be observed

    Examples:
      | room_condition         | outcome                        |
      | valid room id          | request should be successful   |
      | room with no bookings  | request should be successful   |
      | invalid room id        | request should fail            |
      | very large room id     | system should respond appropriately |