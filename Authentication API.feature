Feature: Authentication API Validation

  Scenario Outline: Validate login with multiple credential combinations
    Given the booking API is available
    When I send a POST request to "/api/auth/login" with username "<username>" and password "<password>"
    Then the response status should be <status>
    And the response should indicate authentication result

    Examples:
      | username | password  | status |
      | admin    | password  | 200    |
      | admin    | wrong     | 401    |
      | wrong    | password  | 401    |
      |          | password  | 400    |