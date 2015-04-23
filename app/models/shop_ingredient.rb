class ShopIngredient < ActiveRecord::Base
  belongs_to :shop
  belongs_to :ingredients
end
