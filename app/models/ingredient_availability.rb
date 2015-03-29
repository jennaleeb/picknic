class IngredientAvailability < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :month

  # Ensure you can't add the same ingredient to a given month twice
  validates_uniqueness_of :ingredient_id, scope: [:month_id]
end
