class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :image_url
      t.string :description
      t.integer :creator_id
      t.integer :rating
      t.string :cuisine

      t.timestamps
    end
  end
end
