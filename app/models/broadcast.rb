class Broadcast < ApplicationRecord
  belongs_to :ward, optional: true

  validates :title, presence: true
  validates :message, presence: true
  validates :delivery_type, inclusion: { in: ["In App", "Email", "SMS"] }
  validates :ward_id, presence: true, numericality: { only_integer: true }

  # Mount uploader for image (assuming CarrierWave or similar is used)
  mount_uploader :image, ImageUploader

  enum :delivery_method, { email: 0, sms: 1, in_app: 2 }

  def send_broadcast
    case delivery_method.to_sym
    when :email
      send_email_placeholder
    when :sms
      send_sms_placeholder
    when :in_app
      send_in_app_placeholder
    end
  end

  private

  def send_email_placeholder
    Rails.logger.info("[Broadcast] Sending email: #{title}")
  end

  def send_sms_placeholder
    Rails.logger.info("[Broadcast] Sending SMS: #{title}")
  end

  def send_in_app_placeholder
    Rails.logger.info("[Broadcast] Sending in-app notification: #{title}")
  end
end