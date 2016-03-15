Feature: Creating a new exercise

  Scenario: User created an exercise
    Given I have an account and am logged in
    And   I am in my workout lounge
    And   I click on the New Workout button
    When  I fill in "Duration" with "30"
    And   I fill in "Details" with "running"
    And   I fill in "Activity date" with "2016-04-02"
    Then  I should see the flash message "Exercise has been created"
    And   I should be on that Exercise's page

