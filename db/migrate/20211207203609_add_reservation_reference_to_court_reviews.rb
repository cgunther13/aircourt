class AddReservationReferenceToCourtReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :court_reviews, :reservations
    add_index :court_reviews, :reservation_id
    change_column_null :court_reviews, :reservation_id, false
  end
end
