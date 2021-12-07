class AddReservationReferenceToVistorReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :vistor_reviews, :reservations
    add_index :vistor_reviews, :reservation_id
    change_column_null :vistor_reviews, :reservation_id, false
  end
end
