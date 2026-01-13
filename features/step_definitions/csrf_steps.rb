When(/^I submit a POST to "([^"]*)" with params:$/) do |path, table|
  params = table.rows_hash
  post_with_csrf(path, params)
end
