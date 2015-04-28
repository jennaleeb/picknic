class DropShopIngredients < ActiveRecord::Migration
  def change
  	drop_table :shop_ingredients
  end
end
