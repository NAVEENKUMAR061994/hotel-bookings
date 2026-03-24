Feature: Create Booking API Negative Validation

  Scenario Outline: Validate booking creation with invalid inputs
    Given the booking API is available
    When I send a POST request to "/api/booking" with:
      | roomid    | <roomid>    |
      | firstname | <firstname> |
      | lastname  | <lastname>  |
      | email     | <email>     |
      | phone     | <phone>     |
      | checkin   | <checkin>   |
      | checkout  | <checkout>  |
    Then the response status should be <status>

    Examples:
      | roomid | firstname   | lastname  | email         | phone    | checkin     | checkout    | status |
      | 1      |             | kumar     | test@mail.com | 9999999  | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen      |           | test@mail.com | 9999999  | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen      | kumar     | invalid       | 9999999  | 2025-07-17  | 2025-07-18  | 400    |
      | -1     | naveen      | kumar     | test@mail.com | 9999999  | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen      | kumar     | test@mail.com | abc      | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen      | kumar     | test@mail.com | 9999999  | 2025-07-18  | 2025-07-17  | 400    |