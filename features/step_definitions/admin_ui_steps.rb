When("I sign in via admin UI as {string} with password {string}") do |email, password|
  visit new_admin_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
  puts "After admin UI login, current_path: #{current_path}"
  begin
    session_data = page.get_rack_session
    puts "Capybara rack session keys: #{session_data.keys.inspect}"
  rescue => e
    puts "Could not read rack session: #{e.message}"
  end
  puts page.body[0..800]
end
