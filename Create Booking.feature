@booking
Feature: Room Reservation Creation
  As a user
  User wants to reserve a room
  So that stay can be planned

  Background:
    When the user logs in with valid credentials:
      | username | password |
      | admin    | password |
    Then access should be granted

  @positive
  Scenario Outline: Create reservation with valid details
    Given booking dates "<checkin>" and "<checkout>"
    And user provides reservation details:
      | firstname   | lastname   | email   | phone   | depositpaid   |
      | <firstname> | <lastname> | <email> | <phone> | <depositpaid> |
    When the user submits the reservation
    Then reservation should be created successfully

    Examples:
      | checkin    | checkout   | firstname | lastname | email                  | phone       | depositpaid |
      | 2026-05-10 | 2026-05-12 | Rahul     | Kumar    | rahul@mail.com         | 9876543210  | true        |
      | 2026-06-01 | 2026-06-02 | A         | B        | ab@mail.com            | 9123456789  | false       |

  @negative
  Scenario Outline: Create reservation with invalid inputs
    Given booking dates "<checkin>" and "<checkout>"
    And user provides reservation details:
      | firstname   | lastname   | email   | phone   | depositpaid   |
      | <firstname> | <lastname> | <email> | <phone> | <depositpaid> |
    When the user submits the reservation
    Then the request should be rejected
    And message "<message>" should be shown

    Examples:
      | firstname | lastname | email        | phone       | checkin    | checkout   | message                            | depositpaid |
      |           | Kumar    | test@mail.com| 9876543210  | 2026-05-10 | 2026-05-12 | Firstname should not be blank      | true        |
      | Raj       |          | test@mail.com| 9876543210  | 2026-05-10 | 2026-05-12 | Lastname should not be blank       | false       |
      | Raj       | Kumar    | 12345667654  | 9876543210  | 2026-05-10 | 2026-05-12 | must be a well-formed email address| true        |
      | Raj       | Kumar    | raj@mail.com | 123         | 2026-05-10 | 2026-05-12 | size must be between 11 and 21     | false       |
      | Raj       | Kumar    | raj@mail.com | 9876543210  |            | 2026-05-12 | must not be null                   | true        |
      | Raj       | Kumar    | raj@mail.com | 9876543210  | 2026-05-12 | 2026-05-10 | must be greater than or equal to 1 | false       |