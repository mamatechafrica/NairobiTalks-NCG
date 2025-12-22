class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_api_user!

  private

  def authenticate_api_user!
    # Implement authentication logic here
    # Example: Use token-based authentication
    token = request.headers['Authorization']&.split(' ')&.last
    render json: { error: 'Unauthorized' }, status: :unauthorized unless valid_token?(token)
  end

  def valid_token?(token)
    # Replace with actual token validation logic
    token == 'your_secure_token'
  end
end