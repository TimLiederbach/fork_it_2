class AddImageUrlFormattedAddressToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image_url_formatted_address, :string
  end
end
