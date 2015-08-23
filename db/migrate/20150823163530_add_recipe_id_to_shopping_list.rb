class AddRecipeIdToShoppingList < ActiveRecord::Migration
  def change
    add_reference :shopping_lists, :recipe, index: true
    add_foreign_key :shopping_lists, :recipes
  end
end
