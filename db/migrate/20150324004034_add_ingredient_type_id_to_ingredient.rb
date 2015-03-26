class AddIngredientTypeIdToIngredient < ActiveRecord::Migration
  def change
    add_reference :ingredients, :ingredient_type, index: true
    add_foreign_key :ingredients, :ingredient_types
  end
end
