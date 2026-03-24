  Scenario Outline: Create booking with boundary and edge data
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

    Examples:
      | roomid | firstname      | lastname      | email              | phone        | checkin     | checkout    |
      | 1      | A              | B             | a@mail.com         | 9999999999   | 2025-01-01  | 2025-01-02  |
      | 1      | VeryLongName   | VeryLongLast  | long@mail.com      | 8888888888   | 2025-12-30  | 2025-12-31  |