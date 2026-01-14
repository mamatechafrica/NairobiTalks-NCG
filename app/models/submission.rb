class Submission < ApplicationRecord
  attr_accessor :title, :description, :location, :topic, :anonymity, :citizen_contact, :other_topic

  validates :title, :description, :location, :topic, presence: true
end
