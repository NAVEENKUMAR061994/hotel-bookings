Feature: End-to-End Booking Flow

  Background:
    Given the booking system is available
    And valid test data is prepared

  Scenario: Complete booking lifecycle

    When the user views available rooms
    And selects a room

    And creates a booking
    Then the booking should be created successfully

    When the user views booking details
    Then the booking should be visible

    When the user updates the booking
    Then the updated details should be reflected

    When the user deletes the booking
    Then the booking should no longer exist