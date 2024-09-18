Feature: Student CRUD
  As a user
  I want to create, view, update, and delete students
  So I can manage student information effectively.

  Background:
    Given I am on the students page

  Scenario: Creating a new student
    When I click on "Sign up"
    And I fill in "first_name" with "John"
    And I fill in "last_name" with "Doe"
    And I fill in "email" with "johnnn@example.com"
    And I fill in "password" with "123456"
    And I fill in "password_confirmation" with "123456"
    And I fill in "birthdate" with "2014-12-14"
    And I fill in "contact_no" with "1234567890"
    And I fill in "city" with "New York"
    And I fill in "state" with "NY"
    And I select "India" from "country"
    And I press "Sign Up"
    Then I should see "Welcome! You have signed up successfully"


  Scenario: Viewing a student's details
     Given the following students exist:
      | first_name | last_name | email             | password | password_confirmation | birthdate  | contact_no  | city     | state | country |
      | John       | Doe       | johnnn@example.com | 123456   | 123456                | 2014-12-14 | 1234567890  | New York | NY    | US      |
    When I visit the student's page for "John Doe"
    

  Scenario: Updating a student's details
     Given the following students exist:
      | first_name | last_name | email             | password | password_confirmation | birthdate  | contact_no  | city     | state | country |
      | John       | Doe       | johnnn@example.com | 123456   | 123456                | 2014-12-14 | 1234567890  | New York | NY    | US      |
    When I visit the student's edit page for "John Doe"
      And I fill in "first_name" with "Johnny"
    And I fill in "last_name" with "Doee"
    And I fill in "email" with "johnny"@example.com"
    And I fill in "birthdate" with "2014-12-14"
    And I fill in "contact_no" with "1234567890"
    And I fill in "city" with "New York"
    And I fill in "state" with "NY"
    And I select "Us" from "country"
    And I click the "Update" button
    Then I should see the updated student's details:
      | first_name | last_name | email             | birthdate  | contact_no  | city          | state | country |
      | Johnny    | Doe       | johnny@example.com | 2014-01-01 | 0987654321  | Los Angeles   | CA    | US      |





  Scenario: Deleting a student
    Given a student exists with the following details:
      | first_name | last_name | email                | contact_no | city   | state | country |
      | John       | Doe       | john.doe@example.com | 1234567890 | New York | NY    | US      |
      
    When I visit the student's page
    And I click on "Delete"
    Then I should see "Student was successfully deleted"
    And I should not see "John Doe"
