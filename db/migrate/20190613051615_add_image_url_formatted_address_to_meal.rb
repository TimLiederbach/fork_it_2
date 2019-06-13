class AddImageUrlFormattedAddressToMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :image_url_formatted_address, :string
  end
end
