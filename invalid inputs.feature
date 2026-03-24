  Scenario Outline: Validate delete with unusual inputs
    Given the booking API is available
    When I send a DELETE request to "/api/booking/<bookingid>"
    Then the response status should be <status>

    Examples:
      | bookingid | status |
      | 1.5       | 400    |
      | abc123    | 400    |
      | !@#       | 400    |
      |           | 404    |