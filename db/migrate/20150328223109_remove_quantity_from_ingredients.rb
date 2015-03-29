class RemoveQuantityFromIngredients < ActiveRecord::Migration
  def change
  	remove_column :ingredients, :quantity
  	remove_column :ingredients, :quantity_unit
  end
end
