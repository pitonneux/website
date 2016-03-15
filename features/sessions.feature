Feature: Session management

  Scenario: I sign up to use the app
    Given I am on the home page
    When  I click on the Sign up link
    And   I fill in the "Email" field with "test@example.com"
    And   I fill in the "Password" field with "password"
    And   I fill in the "Password confirmation" field with "password"
    And   I click on the Sign up button
    Then  I should be welcomed to the app

  Scenario: I sign in to the app
    Given I have an account
    And   I am on the home page
    When  I click on the Log in link
    And   I fill in the "Email" field with "test@example.com"
    And   I fill in the "Password" field with "password"
    And   I click on the Log in button
    Then  I should be signed in

  Scenario: I sign out of the app
    Given I have an account and am logged in
    When  I click on the Sign out link
    Then  I should be signed out


