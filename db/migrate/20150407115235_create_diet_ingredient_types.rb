class CreateDietIngredientTypes < ActiveRecord::Migration
  def change
    create_table :diet_ingredient_types do |t|
      t.references :diet, index: true
      t.references :ingredient_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :diet_ingredient_types, :diets
    add_foreign_key :diet_ingredient_types, :ingredient_types
  end
end
