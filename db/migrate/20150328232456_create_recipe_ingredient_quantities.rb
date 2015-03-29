class CreateRecipeIngredientQuantities < ActiveRecord::Migration
  def change
    create_table :recipe_ingredient_quantities do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.decimal :quantity
      t.string :quantity_unit

      t.timestamps null: false
    end
    add_foreign_key :recipe_ingredient_quantities, :recipes
    add_foreign_key :recipe_ingredient_quantities, :ingredients
  end
end
