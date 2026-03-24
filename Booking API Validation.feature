Feature: Create Booking API Validation

  Scenario Outline: Create booking with valid data combinations
    Given the booking API is available
    When I send a POST request to "/api/booking" with valid payload:
      | roomid    | <roomid>    |
      | firstname | <firstname> |
      | lastname  | <lastname>  |
      | email     | <email>     |
      | phone     | <phone>     |
      | checkin   | <checkin>   |
      | checkout  | <checkout>  |
    Then the response status should be 200
    And the response should contain a valid booking ID
    And the response should contain valid booking dates
    And the check-in date should be before the check-out date
    And the response time should be less than 2000 ms

    Examples:
      | roomid | firstname | lastname | email            | phone      | checkin     | checkout    |
      | 1      | ravi      | kumar    | ravi@mail.com    | 9999999999 | 2025-07-17  | 2025-07-18  |
      | 2      | naveen    | messi    | naveen@mail.com  | 8888888888 | 2025-08-01  | 2025-08-05  |