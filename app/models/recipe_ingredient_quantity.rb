class RecipeIngredientQuantity < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :shopping_list_item
end
