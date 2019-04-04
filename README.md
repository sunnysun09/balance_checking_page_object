# balance_checking
<pre>
This is the test project to verify the balance page data, using Cucumber, Ruby, Watir WebDriver, and cheezy Page Object Model.

cheezy page object:
https://github.com/cheezy/page-object


Example Output:

C:\Users\test\balance_checking_new>cucumber
Feature: Verify text fields and balance calculation
  As an end user
  I want to verify the right count of values appear on the screen
            verify the values on the screen are greater than 0
            verify the total balance is correct based on the values listed
            verify the values are formatted as currencies
            verify the total balance matches the sum of the values

  @login
  Scenario Outline: Verify login page           # features/balance.feature:10
    Given I navigate to the "Login_Page" page   # features/balance.feature:11
    When I input "<user_name>" and "<password>" # features/balance.feature:12
    Then I verify landing on the right page     # features/balance.feature:13

    Examples:
      | user_name    | password       |
      | valid_user   | valid_passwd   |
      | invalid_user | invalid_passwd |

  @checking
  Scenario: Verify balance checking              # features/balance.feature:22
    Given I navigate to the "Login_Page" page    # features/step_definitions/balance_steps.rb:1
    When I input "valid_user" and "valid_passwd" # features/step_definitions/balance_steps.rb:6
      Verify labes and textfields appear
      Verify values appear
      Verify values are in currency format
      Verify values larger than 0
      Verify balance is right
    Then I verify the balances are correct       # features/step_definitions/balance_steps.rb:13
      Total balance should be $997000.0, not $1000000.0 (RuntimeError)
      ./features/support/pages/BalanceDetail_Page.rb:78:in `verify_balance_correct'
      ./features/support/pages/BalanceDetail_Page.rb:96:in `verify_balance'
      ./features/step_definitions/balance_steps.rb:14:in `"I verify the balances are correct"'
      features/balance.feature:25:in `Then I verify the balances are correct'

Failing Scenarios:
cucumber features/balance.feature:22 # Scenario: Verify balance checking

3 scenarios (1 failed, 2 passed)
9 steps (1 failed, 8 passed)
0m13.692s

</pre>
