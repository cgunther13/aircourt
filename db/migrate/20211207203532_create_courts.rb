class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.integer :renter_id
      t.integer :court_type
      t.text :directions
      t.text :court_rules
      t.string :location
      t.string :photo
      t.integer :max_guests

      t.timestamps
    end
  end
end
