class AddImageUrlLongitudeToMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :image_url_longitude, :float
  end
end
