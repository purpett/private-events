class CreateEventsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end

    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id
  end
end
