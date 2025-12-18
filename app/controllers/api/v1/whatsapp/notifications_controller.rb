module Api
  module V1
    module Whatsapp
      class NotificationsController < Api::V1::BaseController
        # POST /api/v1/whatsapp/subscribe
        # Subscribe a phone number to notifications
        def subscribe
          phone = normalize_phone(params[:phone])

          unless phone.present?
            return render_error("Phone number is required")
          end

          subscriber = WhatsappSubscriber.find_or_initialize_by(phone: phone)
          
          if subscriber.persisted? && subscriber.active?
            render_success({ 
              message: "You're already subscribed to notifications!",
              subscribed: true 
            })
          else
            subscriber.active = true
            subscriber.ward = params[:ward] if params[:ward].present?
            subscriber.topics = params[:topics] if params[:topics].present?
            
            if subscriber.save
              render_success({ 
                message: "Successfully subscribed to notifications!",
                subscribed: true,
                subscriber_id: subscriber.id
              }, status: :created)
            else
              render_error(subscriber.errors.full_messages.join(", "))
            end
          end
        end

        # DELETE /api/v1/whatsapp/unsubscribe
        # Unsubscribe from notifications
        def unsubscribe
          phone = normalize_phone(params[:phone])

          subscriber = WhatsappSubscriber.find_by(phone: phone)

          if subscriber
            subscriber.update(active: false)
            render_success({ message: "Successfully unsubscribed from notifications." })
          else
            render_success({ message: "You were not subscribed." })
          end
        end

        # GET /api/v1/whatsapp/subscribers
        # Get active subscribers (admin only, for broadcasts)
        def index
          subscribers = WhatsappSubscriber.active
          
          if params[:ward].present?
            subscribers = subscribers.where(ward: params[:ward])
          end

          render_success(subscribers.map { |s|
            {
              id: s.id,
              phone: s.phone,
              ward: s.ward,
              topics: s.topics,
              created_at: s.created_at.iso8601
            }
          })
        end

        # POST /api/v1/whatsapp/broadcast
        # Record a broadcast (actual sending done by Node.js bot)
        def broadcast
          message = params[:message]
          target_ward = params[:ward]
          
          unless message.present?
            return render_error("Message is required")
          end

          subscribers = WhatsappSubscriber.active
          subscribers = subscribers.where(ward: target_ward) if target_ward.present?

          # Return subscriber phones for the Node.js bot to send to
          render_success({
            message: message,
            recipient_count: subscribers.count,
            recipients: subscribers.pluck(:phone)
          })
        end

        private

        def normalize_phone(phone)
          return nil unless phone.present?
          # Remove whatsapp: prefix if present
          phone.to_s.gsub(/^whatsapp:/, '').strip
        end
      end
    end
  end
end
