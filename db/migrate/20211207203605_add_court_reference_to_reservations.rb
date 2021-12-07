class AddCourtReferenceToReservations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reservations, :courts
    add_index :reservations, :court_id
    change_column_null :reservations, :court_id, false
  end
end
