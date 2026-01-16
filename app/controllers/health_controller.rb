# Health check endpoint for Railway
class HealthController < ApplicationController
  def up
    # Simple check - no database queries initially
    render json: {
      status: "ok",
      timestamp: Time.current.iso8601,
      service: "nairobitalks"
    }, status: :ok
  end
end
