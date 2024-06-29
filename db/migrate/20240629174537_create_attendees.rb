class CreateAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.boolean :attendance_status

      t.timestamps
    end
  end
end
