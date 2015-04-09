class CreateUserFavouriteRecipes < ActiveRecord::Migration
  def change
    create_table :user_favourite_recipes do |t|
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_favourite_recipes, :users
    add_foreign_key :user_favourite_recipes, :recipes
  end
end
