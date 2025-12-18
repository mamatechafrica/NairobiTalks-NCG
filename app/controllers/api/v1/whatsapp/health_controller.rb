module Api
  module V1
    module Whatsapp
      class HealthController < Api::V1::BaseController
        # GET /api/v1/whatsapp/health
        # Health check endpoint
        def check
          render json: {
            status: 'ok',
            service: 'NairobiTalks WhatsApp API',
            version: '1.0.0',
            timestamp: Time.current.iso8601,
            database: database_connected?,
            subscribers_count: WhatsappSubscriber.active.count
          }
        end

        private

        def database_connected?
          ActiveRecord::Base.connection.active?
        rescue
          false
        end
      end
    end
  end
end
