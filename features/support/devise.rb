# Warden helpers for Devise in Cucumber
require 'warden'
World Warden::Test::Helpers

Before do
  Warden.test_mode!
end

After do
  Warden.test_reset!
end
