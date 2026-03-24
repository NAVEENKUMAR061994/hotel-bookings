  Scenario Outline: Validate availability with boundary dates
    Given the booking API is available
    When I send a GET request to "/api/room?checkin=<checkin>&checkout=<checkout>"
    Then the response status should be <status>

    Examples:
      | checkin     | checkout    | status |
      | 2025-12-31  | 2026-01-01  | 200    |
      | 2025-02-28  | 2025-03-01  | 200    |
      | 2024-02-29  | 2024-03-01  | 200    |