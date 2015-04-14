class CreateUserFavouriteShops < ActiveRecord::Migration
  def change
    create_table :user_favourite_shops do |t|
      t.references :user, index: true
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_favourite_shops, :users
    add_foreign_key :user_favourite_shops, :shops
  end
end
