Feature: Room Discovery and Details

  Background:
    Given the booking system is available

  Scenario: View all available rooms
    When the user requests the list of rooms
    Then the request should be successful
    And the user should see a list of rooms with details

  Scenario Outline: View room details with different types of room ids
    Given a <room_id_type>
    When the user requests room details
    Then the <outcome> should be observed

    Examples:
      | room_id_type        | outcome                |
      | valid room id       | request should be successful |
      | invalid room id     | request should fail    |
      | non-numeric room id | request should fail    |
      | very large room id  | system should respond appropriately |