class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :court_id
      t.integer :vistor_id

      t.timestamps
    end
  end
end
