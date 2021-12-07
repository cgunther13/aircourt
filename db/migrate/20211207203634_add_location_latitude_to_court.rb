class AddLocationLatitudeToCourt < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :location_latitude, :float
  end
end
