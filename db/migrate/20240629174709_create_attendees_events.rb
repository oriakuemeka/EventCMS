class CreateAttendeesEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :attendees_events do |t|
      t.references :attendee, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
