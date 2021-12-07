class AddLocationFormattedAddressToCourt < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :location_formatted_address, :string
  end
end
