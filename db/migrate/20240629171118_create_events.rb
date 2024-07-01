class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :location
      t.text :description
      t.references :event_type, null: false, foreign_key: true
      t.boolean :attendance_status

      t.timestamps
    end
  end
end
