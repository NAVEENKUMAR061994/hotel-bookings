Feature: Delete Booking API Validation

  Scenario Outline: Validate delete booking functionality
    Given the booking API is available
    When I send a DELETE request to "/api/booking/<bookingid>"
    Then the response status should be <status>

    Examples:
      | bookingid | status |
      | 1         | 200    |
      | 9999      | 404    |
      | -1        | 400    |