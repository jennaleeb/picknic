class CreateIngredientAvailabilities < ActiveRecord::Migration
  def change
    create_table :ingredient_availabilities do |t|
      t.references :ingredient, index: true
      t.references :month, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredient_availabilities, :ingredients
    add_foreign_key :ingredient_availabilities, :months
  end
end
