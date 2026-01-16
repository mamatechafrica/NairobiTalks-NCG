# Health check endpoint for Railway
class HealthController < ApplicationController
  skip_forgery_protection

  def up
    # Simple check - no database queries initially
    render json: {
      status: "ok",
      timestamp: Time.current.iso8601,
      service: "nairobitalks"
    }, status: :ok
  end
end
