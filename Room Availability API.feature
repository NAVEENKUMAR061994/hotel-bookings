Feature: Room Availability API Validation

  Scenario Outline: Validate availability with different date inputs
    Given the booking API is available
    When I send a GET request to "/api/room?checkin=<checkin>&checkout=<checkout>"
    Then the response status should be <status>
    And the response time should be less than 2000 ms

    Examples:
      | checkin     | checkout    | status |
      | 2025-07-17  | 2025-07-18  | 200    |
      | 2025-07-18  | 2025-07-17  | 400    |
      | invalid     | 2025-07-18  | 400    |
      |             | 2025-07-18  | 400    |