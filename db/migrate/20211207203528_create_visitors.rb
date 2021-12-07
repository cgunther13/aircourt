class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :email
      t.string :password
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :sports_interests

      t.timestamps
    end
  end
end
