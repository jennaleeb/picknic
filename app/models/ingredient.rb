class Ingredient < ActiveRecord::Base
	# An ingredient can be classified as a single ingredient type
	belongs_to :ingredient_type

	# Validation rules for ingredients - ingredients must have a name and a quantity
	validates :name, { presence: true }
	validates :quantity, { presence: true, numericality: { greater_than_or_equal_to: 0 } }

	# Scopes

	# Find a list of meat-based ingredients
	def self.meat_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Meat' }
		)
	end

	# Find a list of vegan ingredients
	def self.vegan_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Vegetable', 'Grain', 'Fruit'] }
		)
	end

	# Find a list of ovo-lacto-vegetarian ingredients
	def self.ovo_lacto_vegetarian_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Vegetable', 'Grain', 'Fruit', 'Dairy', 'Egg'] }
		)
	end

	# Find a list of ovo-vegetarian ingredients
	def self.ovo_vegetarian_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Vegetable', 'Grain', 'Fruit', 'Egg'] }
		)
	end

	# Find a list of ovo-vegetarian ingredients
	def self.lacto_vegetarian_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Vegetable', 'Grain', 'Fruit', 'Dairy'] }
		)
	end

	# Find a list of seafood ingredients
	def self.seafood_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Fish, Shellfish'] }
		)
	end

	# Find a list of dairy ingredients
	def self.dairy_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Dairy' }
		)
	end

	# Find a list of egg-based ingredients
	def self.egg_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Egg' }
		)
	end

	# Find a list of nut-based ingredients
	def self.egg_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Nuts' }
		)
	end

end
