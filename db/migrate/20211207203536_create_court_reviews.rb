class CreateCourtReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :court_reviews do |t|
      t.integer :reservation_id
      t.text :body
      t.integer :score

      t.timestamps
    end
  end
end
