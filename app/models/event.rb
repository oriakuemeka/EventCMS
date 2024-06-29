class Event < ApplicationRecord
  belongs_to :event_type
  has_many :attendees_events
  has_many :attendees, through: :attendees_events

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

end
