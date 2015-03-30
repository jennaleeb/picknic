class AddIngredientFieldsToShoppingList < ActiveRecord::Migration
  def change
  	add_column :shopping_list_items, :ingredient_name, :string
  	add_column :shopping_list_items, :ingredient_quantity, :decimal
  	add_column :shopping_list_items, :ingredient_quantity_unit, :string

  	remove_column :shopping_list_items, :recipe_ingredient_quantity_id
  end
end
