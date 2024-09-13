
    Feature: Student Management
      As an admin
      I want to manage students
      So that I can ensure the system has accurate student data

    Scenario: Create a new student
      Given I am on the new student page
      When I fill in "first_name" with "vidhu"
      And I fill in "last_name" with "bhatt"
      And I fill in "email" with "vidhu134@example.com"
      And I fill in "password" with "123456"
      And I fill in "password_confirmation" with "123456"
      And I fill in "birthdate" with "2014-12-14" 
      And I fill in "contact_no" with "1778365894"
      And I fill in "city" with "Surat"
      And I fill in "state" with "Gujarat"
      And I select "India" from "country"
      And I press "Sign Up"
      Then I should see "Welcome! You have signed up successfully"

