class CreateVistorReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :vistor_reviews do |t|
      t.integer :reservation_id
      t.text :body
      t.integer :score

      t.timestamps
    end
  end
end
