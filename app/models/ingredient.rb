class Ingredient < ActiveRecord::Base
	
	# An ingredient has many recipes, which is managed through a tracking table of ingredient quanities-per-recipe 
	has_many :recipe_ingredient_quantities
	has_many :recipes, through: :recipe_ingredient_quantities
	# An ingredient can be classified as a single ingredient type
	belongs_to :ingredient_type
	# An ingredient has many months where it is available (in season)
	has_many :ingredient_availabilities
	has_many :months, through: :ingredient_availabilities
	
	accepts_nested_attributes_for :ingredient_availabilities
	accepts_nested_attributes_for :months
	# An ingredient is available in many shops
	has_many :shop_ingredients
	has_many :shops, through: :shop_ingredients


	# Validation rules for ingredients - ingredients must have a name
	validates :name, :presence => { message: "You've entered a blank name for the ingredient.  Please re-enter the ingredient name."}

	INGREDIENT_TYPES = ["Vegan", "Vegetarian", "Dairy", "Seafood", "Nuts", "Meat", "Meat and Seafood"]

	# Scopes

	# Find a list of meat-based ingredients
	def self.meat_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Meat' }
		)
	end

	# Find a list of meat and seafood based ingredients ingredients
	def self.meat_and_seafood_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: ['Meat', 'Fish', 'Shellfish'] }
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
			ingredient_types: { name: ['Fish', 'Shellfish'] }
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
	def self.nut_ingredients
		joins(:ingredient_type).where(
			ingredient_types: { name: 'Nuts' }
		)
	end

	# add month attribute to ingredient
	def months=(months)
		ingredient_availabilities.clear

		months.each do |month|
			ingredient_availabilities.build(month_id: month)
		end
	end

end
