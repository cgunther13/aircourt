class AddVistorReferenceToReservations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reservations, :visitors, column: :vistor_id
    add_index :reservations, :vistor_id
    change_column_null :reservations, :vistor_id, false
  end
end
