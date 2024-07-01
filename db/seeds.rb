# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Ensure the admin user exists in development
if Rails.env.development?
  AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end
end

# Clear existing data to avoid duplicates
EventType.destroy_all
Event.destroy_all
Attendee.destroy_all
AttendeesEvent.destroy_all

# Output for progress tracking
puts "Seeding process started..."

# Create Event Types (5 unique types)
event_types = ['Conference', 'Workshop', 'Meetup', 'Seminar', 'Webinar']
event_type_objects = event_types.map { |type| EventType.create!(name: type) }

puts "Created #{EventType.count} event types."

# Create 250 Events using Faker
250.times do
  Event.create!(
    name: Faker::Marketing.buzzwords,
    date: Faker::Date.forward(days: 90),
    location: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    event_type: event_type_objects.sample
  )
end

puts "Created #{Event.count} events."

# Create 250 Attendees using Faker
250.times do
  Attendee.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    attendance_status: [true, false].sample
  )
end

puts "Created #{Attendee.count} attendees."

# Create AttendeesEvents to link attendees and events
# Ensuring each event has multiple attendees and each attendee attends multiple events
event_ids = Event.pluck(:id)
attendee_ids = Attendee.pluck(:id)

250.times do
  event_id = event_ids.sample
  attendee_ids.sample(10).each do |attendee_id|
    AttendeesEvent.create!(attendee_id: attendee_id, event_id: event_id)
  end
end

# Ensure that the total count for AttendeesEvents is at least 250
# Additional associations to meet the minimum requirement
until AttendeesEvent.count >= 250
  AttendeesEvent.create!(
    attendee_id: attendee_ids.sample,
    event_id: event_ids.sample
  )
end

puts "Seeding completed successfully!"
