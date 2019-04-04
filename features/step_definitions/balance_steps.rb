Given("I navigate to the {string} page") do |page|
  $page = page
  visit($page).await 
end

When("I input {string} and {string}") do |username, passwd|
  on($page).login(username, passwd)
end

Then("I verify landing on the right page") do
end

Then("I verify the balances are correct") do
  on($page).verify_balance
end

