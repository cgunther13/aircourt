class AddRenterReferenceToCourts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :courts, :renters
    add_index :courts, :renter_id
    change_column_null :courts, :renter_id, false
  end
end
