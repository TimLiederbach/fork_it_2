class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :restaurant_id
      t.string :image_url

      t.timestamps
    end
  end
end
