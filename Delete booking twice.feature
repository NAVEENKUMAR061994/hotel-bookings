  Scenario: Delete booking twice
    Given the booking API is available
    When I delete a valid booking
    Then the response status should be 200
    When I delete the same booking again
    Then the response status should be 404