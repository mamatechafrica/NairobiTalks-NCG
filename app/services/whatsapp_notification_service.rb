# app/services/whatsapp_notification_service.rb
class WhatsappNotificationService
  BOT_URL = ENV['WHATSAPP_BOT_URL'] || 'http://localhost:3000'

  def self.notify_status_change(submission)
    return unless submission.citizen_contact.present?
    
    # Extract tracking number from admin_comment
    tracking_number = extract_tracking_number(submission)
    
    payload = {
      phone: format_phone(submission.citizen_contact),
      tracking_number: tracking_number,
      status: submission.status,
      title: submission.title,
      message: generate_status_message(submission)
    }

    send_notification(payload)
  end

  private

  def self.extract_tracking_number(submission)
    match = submission.admin_comment&.match(/Tracking: ([\w-]+)/)
    match ? match[1] : "ID-#{submission.id}"
  end

  def self.format_phone(phone)
    # Ensure phone has whatsapp: prefix
    phone = phone.to_s.strip
    phone.start_with?('whatsapp:') ? phone : "whatsapp:#{phone}"
  end

  def self.generate_status_message(submission)
    case submission.status
    when 'submitted'
      "Your idea has been received and is in our queue for review."
    when 'under_review'
      "Great news! Your idea is now being reviewed by our team."
    when 'reviewed'
      "Your idea has been reviewed. Decision pending."
    when 'approved'
      "Congratulations! Your idea has been approved. We'll coordinate next steps soon."
    when 'rejected'
      "Thank you for your submission. Unfortunately, this idea doesn't meet our current criteria."
    when 'completed'
      "🎉 Your idea has been implemented! Thank you for making Nairobi better."
    else
      "Status updated. Send TRACK #{extract_tracking_number(submission)} for full details."
    end
  end

  def self.send_notification(payload)
    uri = URI("#{BOT_URL}/notifications/status-update")
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 5
    http.read_timeout = 5

    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body = payload.to_json

    response = http.request(request)
    
    if response.is_a?(Net::HTTPSuccess)
      Rails.logger.info("✅ Notification sent for tracking #{payload[:tracking_number]}")
      true
    else
      Rails.logger.error("❌ Notification failed: #{response.body}")
      false
    end
  rescue StandardError => e
    Rails.logger.error("❌ Notification error: #{e.message}")
    false
  end
end
