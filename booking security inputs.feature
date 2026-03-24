  Scenario Outline: Validate booking with malformed and security inputs
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
      | roomid | firstname        | lastname  | email            | phone      | checkin     | checkout    | status |
      | 1      | ' OR 1=1 --      | kumar     | test@mail.com    | 9999999999 | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | <script>alert(1) | kumar     | test@mail.com    | 9999999999 | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen           | kumar     | test@@mail.com   | 9999999999 | 2025-07-17  | 2025-07-18  | 400    |
      | 1      | naveen           | kumar     | test@mail.com    | 123        | 2025-07-17  | 2025-07-18  | 400    |