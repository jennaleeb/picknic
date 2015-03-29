class IngredientAvailability < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :month


end
