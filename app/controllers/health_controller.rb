class HealthController < ApplicationController
  def up
    render json: { status: "ok", timestamp: Time.current.iso8601 }, status: :ok
  end
end
