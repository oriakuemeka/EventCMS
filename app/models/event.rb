class Event < ApplicationRecord
  belongs_to :event_type
  has_many :attendees_events
  has_many :attendees, through: :attendees_events

end
