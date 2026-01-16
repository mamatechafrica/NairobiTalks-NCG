# Health check endpoint for Railway
class HealthController < ApplicationController
  skip_forgery_protection
  skip_before_action :verify_authenticity_token

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
