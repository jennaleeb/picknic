class AddYummlyIdToUserFavouriteRecipes < ActiveRecord::Migration
  def change
    add_column :user_favourite_recipes, :yummly_id, :string
  end
end
