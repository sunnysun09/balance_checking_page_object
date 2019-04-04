Feature: Verify text fields and balance calculation 
  As an end user
  I want to verify the right count of values appear on the screen
            verify the values on the screen are greater than 0
            verify the total balance is correct based on the values listed
            verify the values are formatted as currencies
            verify the total balance matches the sum of the values

  @login
  Scenario Outline: Verify login page
    Given I navigate to the "Login_Page" page
    When I input "<user_name>" and "<password>"
    Then I verify landing on the right page

    Examples:
    | user_name    | password       |
    | valid_user   | valid_passwd   | 
    | invalid_user | invalid_passwd | 


  @checking
  Scenario: Verify balance checking
    Given I navigate to the "Login_Page" page
    When I input "valid_user" and "valid_passwd"
    Then I verify the balances are correct