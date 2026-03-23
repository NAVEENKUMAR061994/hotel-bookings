


Feature: View Rooms on Homepage as user

  Scenario: User views available rooms on homepage
    Given I navigate to the booking website homepage
    Then I should see a list of available rooms
    And each room should display image, price, and description

  Scenario: Room details are visible
    Given I am on the homepage
    When I view a room detail
    Then I should see room name, type, and price

Feature: Select Room and Open Booking Form as user

  Scenario: User selects a room to book
    Given I am on the homepage
    When I click on a room
    Then I should be redirected to the reservation page

  Scenario: Booking form is displayed
    Given I am on the reservation page
    Then I should see a booking form
    And the form should contain fields for name, email, phone, and dates

Feature: Select Booking Dates as user

  Scenario: User selects valid check-in and check-out dates
    Given I am on the reservation page
    When I select check-in date as "2025-07-21"
    And I select check-out date as "2025-07-22"
    Then the selected dates should be accepted

  Scenario: User selects invalid date range
    Given I am on the reservation page
    When I select check-in date as "2025-07-23"
    And I select check-out date as "2025-07-22"
    Then I should see a validation error

Feature: Create Booking from UI

  Scenario: Successful booking
    Given I am on the reservation page
    And I enter valid user details
    When I click on "Book Now"
    Then the booking should be successful
    And I should see a confirmation message

  Scenario: Booking with missing fields
    Given I am on the reservation page
    When I click on "Book Now" without entering required details
    Then I should see validation error messages

Feature: Booking Form Validation

  Scenario: Invalid email format
    Given I am on the reservation page
    When I enter an invalid email
    Then I should see an email validation error

  Scenario: Invalid phone number
    Given I am on the reservation page
    When I enter an invalid phone number
    Then I should see a phone validation error

Feature: Booking Confirmation

  Scenario: Verify booking confirmation message
    Given I complete a valid booking
    Then I should see a success message
    And the booking details should be displayed

Feature: Admin Login

  Scenario: Login with valid credentials
    Given I navigate to "/#/admin"
    When I enter username "admin" and password "password"
    And I click login
    Then I should be logged into admin dashboard

  Scenario: Login with invalid credentials
    Given I navigate to "/#/admin"
    When I enter invalid credentials
    Then I should see login error message

Feature: Manage Bookings (Admin)

  Scenario: View booking list
    Given I am logged in as admin
    Then I should see list of bookings

  Scenario: Edit a booking
    Given I am logged in as admin
    When I edit a booking
    Then the booking should be updated successfully

  Scenario: Delete a booking
    Given I am logged in as admin
    When I delete a booking
    Then the booking should be removed from the list

Feature: Contact Form

  Scenario: Submit contact form successfully
    Given I am on the homepage
    When I fill in contact form with valid details
    And I click submit
    Then the message should be sent successfully

  Scenario: Submit contact form with missing fields
    Given I am on the homepage
    When I submit the form without required fields
    Then I should see validation errors

Feature: Advanced Booking Validation

  Scenario: Booking with maximum allowed date range
    Given I am on reservation page
    When I select check-in as "2025-01-01"
    And I select check-out as "2025-12-31"
    Then booking should be processed successfully

  Scenario: Booking with same check-in and check-out date
    Given I am on reservation page
    When I select same date for check-in and check-out
    Then system should show validation error

  Scenario: Booking overlapping existing booking
    Given a room is already booked for given dates
    When I try to book same room for overlapping dates
    Then booking should be rejected

Feature: validate header contents on scroll

  Scenario: View header contents
    Given I am on the homepage
    When I scroll to bottom
    And I scroll again to top
    Then I should see header all the time

Feature: Input Field Validation

  Scenario: First name with special characters
    Given I am on reservation page
    When I enter "Test@123" as first name
    Then validation error should be displayed

  Scenario: Empty mandatory fields
    Given I am on reservation page
    When I leave all fields empty
    And I click Book
    Then all required field errors should be shown

  Scenario: Extremely long input values
    Given I am on reservation page
    When I enter 500 characters in name field
    Then input should be restricted or error shown

Feature: API Edge Cases

  Scenario: Create booking with invalid room ID
    Given API is available
    When I send POST request with roomid 9999
    Then response should be error

  Scenario: Delete already deleted booking
    Given booking is already deleted
    When I try to delete again
    Then response should indicate not found

  Scenario: Update booking without body
    Given API is available
    When I send PUT request without body
    Then response should be 400 bad request

Feature: UI Validation

  Scenario: Page loads correctly
    Given I open homepage
    Then all images should load properly

  Scenario: Buttons are clickable
    Given I am on homepage
    Then all buttons should be clickable

  Scenario: Mobile responsiveness
    Given I open site on mobile view
    Then layout should adjust properly

Feature: End-to-End Booking Flow

  Scenario: Complete booking journey
    Given I am on homepage
    When I select a room
    And I enter valid booking details
    And I confirm booking
    Then booking should be successful
    And booking should appear in admin panel