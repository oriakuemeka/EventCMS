class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :location
      t.text :description
      t.references :event_type, null: false, foreign_key: true
      t.string :rails
      t.string :generate
      t.string :model
      t.string :Attendee
      t.string :name
      t.string :email
      t.boolean :attendance_status
      t.string :rails
      t.string :generate
      t.string :model
      t.string :EventType
      t.string :name
      t.string :rails
      t.string :generate
      t.string :model
      t.string :AttendeesEvent
      t.references :attendee, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
