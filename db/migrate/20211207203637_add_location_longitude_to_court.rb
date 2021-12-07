class AddLocationLongitudeToCourt < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :location_longitude, :float
  end
end
