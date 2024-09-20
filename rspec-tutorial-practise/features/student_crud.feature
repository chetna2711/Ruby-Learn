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
    And I fill in "email" with "johntgfhfs@example.com"
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
     Given the following student exist:
      | first_name | last_name | email             | password | password_confirmation | birthdate  | contact_no  | city     | state | country |
      | John       | Doe       | johntgfhfs@example.com | 123456   | 123456           | 2014-12-14 | 1234567890  | New York |  NY   | US      |
    When I visit the student's page for "John Doe"
    

  Scenario: Updating a student's details
     Given the following student exist:
      | first_name | last_name | email                  | password | password_confirmation | birthdate  | contact_no  | city     | state | country |
      | John       | Doe       | johntgfhfs@example.com | 123456   | 123456           | 2014-12-14 | 1234567890  | New York |  NY   | US      |
    Given I am logged in as "johntgfhfs@example.com" 
    When I visit the student's edit page for "John Doe"
    And I enter "Johnny" into the "First name" field
    And I enter "Doeee" into the "Last name" field
    And I enter "2020-08-06" into the "Birthdate" field
    And I enter "Goa" into the "City" field
    And I enter "Mumbai" into the "State" field
    And I select "Canada" from "Country"
    And I press "Update"
     Then I should see "Student was successfully updated"
   

  Scenario: Deleting a student
    Given the following student exist:
      | first_name | last_name | email                  | password | password_confirmation | birthdate  | contact_no  | city | state  | country |
      | Johnny     | Doeee     | johntgfhfs@example.com | 123456   | 123456              |2020-08-06  | 1234567890  | Goa  | Mumbai | Canada  |
    When I visit the student's page
    And I press "Delete" for "Johnny Doe"
    Then I should see "Student was successfully deleted"
    Then I should not see "Johnny Doe" in the table
  
   
