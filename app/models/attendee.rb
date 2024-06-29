class Attendee < ApplicationRecord

  has_many :attendees_events
  has_many :events, through: :attendees_events

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
