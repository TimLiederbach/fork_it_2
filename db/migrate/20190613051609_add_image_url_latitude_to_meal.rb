class AddImageUrlLatitudeToMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :image_url_latitude, :float
  end
end
