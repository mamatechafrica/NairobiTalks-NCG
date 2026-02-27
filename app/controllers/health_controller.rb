# Health check endpoint
class HealthController < ApplicationController
  skip_forgery_protection raise: false

  def up
    # Simple check - no database queries initially
    render json: {
      status: "ok",
      timestamp: Time.current.iso8601,
      service: "nairobitalks",
      rails_env: Rails.env
    }, status: :ok
  end
end
