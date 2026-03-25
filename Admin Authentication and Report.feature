@authentication
Feature: User Authentication
  As a user
  User wants to login
  So that secure access is provided

  @positive
  Scenario: Login with valid credentials
    When user submits:
      | username | password |
      | admin    | password |
    Then access should be granted

  @negative
  Scenario Outline: Login with invalid credentials
    Given login attempt is made
    When user submits:
      | username   | password   |
      | <username> | <password> |
    Then access should be denied
    And message "<message>" should be shown

    Examples:
      | username | password   | message              |
      | admin1   | password   | Invalid credentials  |
      | admin    | wrong      | Invalid credentials  |
      |          | password   | Invalid credentials  |
      | admin    |            | Invalid credentials  |