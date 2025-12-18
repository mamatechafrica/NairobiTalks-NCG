module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :verify_api_key

      private

      def verify_api_key
        api_key = request.headers['X-API-Key'] || params[:api_key]
        
        # For development, allow requests without API key
        # In production, uncomment the following:
        # unless api_key.present? && ActiveSupport::SecurityUtils.secure_compare(api_key, ENV['WHATSAPP_API_KEY'])
        #   render json: { error: 'Unauthorized' }, status: :unauthorized
        # end
      end

      def render_success(data, status: :ok)
        render json: { success: true, data: data }, status: status
      end

      def render_error(message, status: :unprocessable_entity)
        render json: { success: false, error: message }, status: status
      end
    end
  end
end
