class Submission
  include ActiveModel::Model
  attr_accessor :title, :description, :location, :topic, :anonymity, :citizen_contact, :other_topic

  validates :title, :description, :location, :topic, presence: true

  # Simple in-memory save that respects validations so controller flows work
  def save
    valid?
  end
end
