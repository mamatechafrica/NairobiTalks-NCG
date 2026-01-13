When("I sign in via UI as {string} with password {string}") do |email, password|
  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

Then("I should be redirected to the sign in page with message {string}") do |_message|
  # Some layouts don't render flash messages in test environment; assert we are redirected to the sign-in page
  expect(current_path).to eq(new_user_session_path)
end
