class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.boolean :done
      t.references :shopping_list, index: true
      t.references :recipe_ingredient_quantity, index: true

      t.timestamps null: false
    end
    add_foreign_key :shopping_list_items, :shopping_lists
    add_foreign_key :shopping_list_items, :recipe_ingredient_quantities
  end
end
