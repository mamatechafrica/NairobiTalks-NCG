Given("a user exists with email {string} and password {string}") do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Given("a user exists with email {string} and password {string} and admin flag") do |email, password|
  User.create!(email: email, password: password, password_confirmation: password, admin: true)
end

When("I sign in as {string}") do |email|
  user = User.find_by(email: email)
  raise "No user with email #{email} found" unless user
  login_as(user, scope: :user)
  # Visit home page so the session/cookie is available to subsequent Capybara requests
  visit root_path
end

When("I sign out") do
  logout(:user)
end
