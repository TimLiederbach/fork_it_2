class AddImageUrlLongitudeToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image_url_longitude, :float
  end
end
