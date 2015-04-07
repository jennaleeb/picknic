class DietIngredientType < ActiveRecord::Base
  belongs_to :diet
  belongs_to :ingredient_type
end
