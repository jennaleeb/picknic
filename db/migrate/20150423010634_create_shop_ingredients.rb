class CreateShopIngredients < ActiveRecord::Migration
  def change
    create_table :shop_ingredients do |t|
      t.references :shop, index: true
      t.references :ingredients, index: true

      t.timestamps null: false
    end
    add_foreign_key :shop_ingredients, :shops
    add_foreign_key :shop_ingredients, :ingredients
  end
end
