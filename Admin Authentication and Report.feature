Feature: Admin Authentication and Security

  Background:
    Given the booking system is available

  Scenario Outline: Login with different credentials
    When the admin provides <credential_type>
    Then the <outcome> should be observed

    Examples:
      | credential_type     | outcome              |
      | valid credentials   | access should be granted |
      | invalid credentials | access should be denied  |

  Scenario Outline: Access secured functionality with different authentication states
    Given <auth_state>
    When a user accesses secured functionality
    Then access should be denied

    Examples:
      | auth_state            |
      | without authentication |
      | with invalid token     |
      | with expired token     |