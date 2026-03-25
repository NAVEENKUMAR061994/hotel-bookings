@e2e
Feature: Complete Booking Flow
  As a user
  User wants to complete full booking journey
  So that reservation lifecycle is managed

  Background:
    Given system is accessible
    And valid credentials are available

  @positive
  Scenario: Complete flow successfully
    When the user views rooms
    And selects a room
    And creates booking
    Then booking should be created

    When booking is retrieved
    Then details should be visible

    When booking is updated
    Then updated data should be saved

    When booking is deleted
    Then booking should not exist

  @negative
  Scenario: Attempt flow without authentication
    Given user is not authenticated
    When booking operations are attempted
    Then access should be denied