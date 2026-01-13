# This file is loaded by Cucumber and sets up Capybara and DB cleaning
require 'cucumber/rails'
require 'webdrivers'
require 'rspec/expectations'
World(RSpec::Matchers)

# Capybara
Capybara.configure do |config|
  config.default_max_wait_time = 5
  config.server = :puma, { Silent: true }
end

# Use headless chrome for JS-enabled scenarios
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new') if Gem::Version.new(Selenium::WebDriver::VERSION) >= Gem::Version.new('4.0')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome_headless

# Database Cleaner: ensure a clean state between scenarios
require 'database_cleaner/active_record'

Before do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.start
end

Before('@javascript') do
  DatabaseCleaner.strategy = :truncation
end

After do |scenario|
  if scenario.failed?
    # take a screenshot and store in tmp/screenshots
    FileUtils.mkdir_p('tmp/screenshots')
    name = "screenshot-#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    page.save_screenshot("tmp/screenshots/#{name}") rescue nil
  end
  DatabaseCleaner.clean
end
