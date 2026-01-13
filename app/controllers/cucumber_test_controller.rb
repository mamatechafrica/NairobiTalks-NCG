class CucumberTestController < ApplicationController
  # Simple POST endpoint used only by Cucumber features to verify CSRF behavior.
  def csrf_echo
    render plain: "OK"
  end
end
