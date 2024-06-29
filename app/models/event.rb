class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :attendee
  belongs_to :event
end
