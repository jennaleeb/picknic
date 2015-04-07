class IngredientType < ActiveRecord::Base
	# An ingredient type encompasses many ingredients
	has_many :ingredients

	# An ingredient type may be associated to many diets
	has_many :diet_ingredient_type
	has_many :diets, through: :diet_ingredient_type

	# An ingredient type must have a name
	validates :name, { presence: true, uniqueness: true }
end
