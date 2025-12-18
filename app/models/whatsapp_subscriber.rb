class WhatsappSubscriber < ApplicationRecord
  # Validations
  validates :phone, presence: true, uniqueness: true

  # Scopes
  scope :active, -> { where(active: true) }
  scope :by_ward, ->(ward) { where(ward: ward) if ward.present? }

  # Callbacks
  before_validation :normalize_phone

  # Check if subscriber is active
  def active?
    active == true
  end

  private

  def normalize_phone
    return unless phone.present?
    # Remove whatsapp: prefix and normalize
    self.phone = phone.to_s.gsub(/^whatsapp:/, '').strip
  end
end
