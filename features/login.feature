Feature: Login
  In order to use the site
  As a valid user
  I want to login
  
  
  Scenario: login
    Given a valid user
    When I go to the login page
    Then I fill in "kevin@rebelcolony.com" for "user_session_email"
    Then I fill in "123456" for "user_session_password"
    Then I press "user_session_submit"
    Then I should see "Logged in as kevin@rebelcolony.com"
  

  Scenario: logout
    Given I am logged in
    Then I follow "logout"
    Then show me the page
    Then I should see "Sucessfully logged out"