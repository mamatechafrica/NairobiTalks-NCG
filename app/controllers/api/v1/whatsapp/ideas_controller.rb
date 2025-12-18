module Api
  module V1
    module Whatsapp
      class IdeasController < Api::V1::BaseController
        # POST /api/v1/whatsapp/submit_idea
        # Submit a new community idea via WhatsApp
        def create
          # Generate tracking number
          tracking_number = generate_tracking_number

          # Create the submission
          submission = CitizenSubmission.new(
            title: idea_params[:title] || "WhatsApp Submission #{tracking_number}",
            description: idea_params[:description],
            location: idea_params[:ward] || idea_params[:location] || "Not specified",
            topic: idea_params[:topic] || "General",
            citizen_contact: idea_params[:phone],
            status: "submitted",
            anonymity: idea_params[:anonymous] ? "anonymous" : "public"
          )

          # Store tracking number in admin_comment for now (can add dedicated field later)
          submission.admin_comment = "Tracking: #{tracking_number} | Via: WhatsApp"

          if submission.save
            render_success({
              tracking_number: tracking_number,
              id: submission.id,
              status: submission.status,
              message: "Your idea has been submitted successfully!"
            }, status: :created)
          else
            render_error(submission.errors.full_messages.join(", "))
          end
        end

        # GET /api/v1/whatsapp/track/:tracking_id
        # Track status of an idea
        def track
          tracking_id = params[:tracking_id].to_s.upcase

          # Search in admin_comment for tracking number or by ID
          submission = CitizenSubmission.where("admin_comment LIKE ?", "%Tracking: #{tracking_id}%").first
          submission ||= CitizenSubmission.find_by(id: tracking_id.gsub(/\D/, '')) if tracking_id.match?(/\d+/)

          if submission
            render_success({
              tracking_number: extract_tracking_number(submission),
              title: submission.title,
              description: truncate_text(submission.description, 100),
              status: submission.status,
              status_label: submission.status_label,
              location: submission.location,
              topic: submission.topic,
              submitted_at: submission.created_at.iso8601,
              updated_at: submission.updated_at.iso8601
            })
          else
            render_error("No submission found with tracking ID: #{tracking_id}", status: :not_found)
          end
        end

        # GET /api/v1/whatsapp/recent_ideas
        # Get recent community ideas for browsing
        def recent
          limit = (params[:limit] || 5).to_i.clamp(1, 20)
          ward = params[:ward]
          topic = params[:topic]

          ideas = CommunityIdea.order(created_at: :desc)
          ideas = ideas.with_ward(ward) if ward.present?
          ideas = ideas.with_topic(topic) if topic.present?
          ideas = ideas.limit(limit)

          render_success(ideas.map { |idea|
            {
              id: idea.id,
              title: idea.title,
              description: truncate_text(idea.description, 80),
              ward: idea.ward,
              topic: idea.topic,
              status: idea.status,
              votes: idea.net_score,
              created_at: idea.created_at.iso8601
            }
          })
        end

        # POST /api/v1/whatsapp/vote
        # Vote on a community idea
        def vote
          idea = CommunityIdea.find_by(id: params[:idea_id])

          unless idea
            return render_error("Idea not found", status: :not_found)
          end

          direction = params[:direction].to_s.downcase

          case direction
          when "up", "upvote"
            idea.increment!(:upvotes)
            render_success({ message: "Upvoted! Current score: #{idea.net_score}", votes: idea.net_score })
          when "down", "downvote"
            idea.increment!(:downvotes)
            render_success({ message: "Downvoted! Current score: #{idea.net_score}", votes: idea.net_score })
          else
            render_error("Invalid vote direction. Use 'up' or 'down'")
          end
        end

        private

        def idea_params
          params.permit(:title, :description, :ward, :location, :topic, :phone, :anonymous)
        end

        def generate_tracking_number
          prefix = "NT"
          date_part = Date.today.strftime("%y%m")
          random_part = SecureRandom.alphanumeric(4).upcase
          "#{prefix}-#{date_part}-#{random_part}"
        end

        def extract_tracking_number(submission)
          match = submission.admin_comment&.match(/Tracking: ([\w-]+)/)
          match ? match[1] : "ID-#{submission.id}"
        end

        def truncate_text(text, length)
          return "" unless text
          text.length > length ? "#{text[0...length]}..." : text
        end
      end
    end
  end
end
