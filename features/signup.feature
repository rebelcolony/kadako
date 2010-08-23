Feature: Signup
  In order to use the website
  As a candidate
  I want to be able to signup
  
  Scenario: signup
    Given I am on the signup page
    When I fill in "kevin@rebelcolony.com" for "user_email"
    When I fill in "123456" for "user_password"
    When I fill in "123456" for "user_password_confirmation"
    When I press "user_submit"
    Then I should see "Registration successfull" 
    Then "kevin@rebelcolony.com" should receive an email
    

  
  
  

  
