# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create all possible ingredient types
ingredient_types = IngredientType.create(
		[ { name: 'Meat'},
			{ name: 'Fish'},
			{ name: 'Shellfish'},
			{ name: 'Vegetable'},
			{ name: 'Grain'},
			{ name: 'Fruit'},
			{ name: 'Dairy'},
			{ name: 'Egg'},
			{ name: 'Nuts'}
		]
	);

meat_id = IngredientType.find_by(name: 'Meat').id;
fish_id = IngredientType.find_by(name: 'Fish').id;
shellfish_id = IngredientType.find_by(name: 'Shellfish').id;
vegetable_id = IngredientType.find_by(name: 'Vegetable').id;
grain_id = IngredientType.find_by(name: 'Grain').id;
fruit_id = IngredientType.find_by(name: 'Fruit').id;
dairy_id = IngredientType.find_by(name: 'Dairy').id;
egg_id = IngredientType.find_by(name: 'Egg').id;
nuts_id = IngredientType.find_by(name: 'Nuts').id;

# Create a sample list of ingredients
# Ingredient.create(name: "Chicken", ingredient_type_id: meat_id );
# Ingredient.create(name: "Chuck Roast Beef", ingredient_type_id: meat_id );
# Ingredient.create(name: "Bacon", ingredient_type_id: meat_id );
# Ingredient.create(name: "Salmon", ingredient_type_id: fish_id );
# Ingredient.create(name: "Cod", ingredient_type_id: fish_id );
# Ingredient.create(name: "Scallops", ingredient_type_id: shellfish_id  );
# Ingredient.create(name: "Shrimp", ingredient_type_id: shellfish_id );
# Ingredient.create(name: "Lobster", ingredient_type_id: shellfish_id  );
# Ingredient.create(name: "Tomatoes", ingredient_type_id: vegetable_id  );
# Ingredient.create(name: "Carrots", ingredient_type_id: vegetable_id );
# Ingredient.create(name: "Potatoes", ingredient_type_id: vegetable_id );
# Ingredient.create(name: "Kale", ingredient_type_id: vegetable_id );
# Ingredient.create(name: "Broccoli", ingredient_type_id: vegetable_id );
# Ingredient.create(name: "Cauliflower", ingredient_type_id: vegetable_id );
# Ingredient.create(name: "Brown Rice", ingredient_type_id: grain_id );
# Ingredient.create(name: "Quinoa", ingredient_type_id: grain_id );
# Ingredient.create(name: "Apples", ingredient_type_id: fruit_id );
# Ingredient.create(name: "Oranges", ingredient_type_id: fruit_id );
# Ingredient.create(name: "Bartlett Pear", ingredient_type_id: fruit_id );
# Ingredient.create(name: "Milk", ingredient_type_id: dairy_id );
# Ingredient.create(name: "Whipping Cream", ingredient_type_id: dairy_id );
# Ingredient.create(name: "Gruyere Cheese", ingredient_type_id: dairy_id );
# Ingredient.create(name: "Large Eggs", ingredient_type_id: egg_id );
# Ingredient.create(name: "Egg White", ingredient_type_id: egg_id );
# Ingredient.create(name: "Almonds", ingredient_type_id: nuts_id );
# Ingredient.create(name: "Pecans", ingredient_type_id: nuts_id );
# Ingredient.create(name: "Nutella", ingredient_type_id: nuts_id );

# ingredient_bacon_id = Ingredient.find_by(name: "Bacon").id
# ingredient_cod_id = Ingredient.find_by(name: "Cod").id
# ingredient_scallops_id = Ingredient.find_by(name: "Scallops").id
# ingredient_tomatoes_id = Ingredient.find_by(name: "Tomatoes").id
# ingredient_carrots_id = Ingredient.find_by(name: "Carrots").id
# ingredient_broccoli_id = Ingredient.find_by(name: "Broccoli").id
# ingredient_cauliflower_id = Ingredient.find_by(name: "Cauliflower").id
# ingredient_apple_id = Ingredient.find_by(name: "Apples").id
# ingredient_bartlett_pear_id = Ingredient.find_by(name: "Bartlett Pear").id
# ingredient_gruyere_cheese_id = Ingredient.find_by(name: "Gruyere Cheese").id
# ingredient_large_eggs_id = Ingredient.find_by(name: "Large Eggs").id


# Create the possible diets (modified to yummly's version)
Diet.create(name: "Vegetarian", yummly_diet_id: "387^Lacto-ovo vegetarian")
Diet.create(name: "Vegan", yummly_diet_id: "386^Vegan")
Diet.create(name: "Pescetarian", yummly_diet_id: "390^Pescetarian")
Diet.create(name: "Paleo", yummly_diet_id: "403^Paleo")
Diet.create(name: "Ovo vegetarian", yummly_diet_id:"389^Ovo vegetarian")
Diet.create(name: "Lacto vegetarian", yummly_diet_id:"388^Lacto vegetarian")

# Create the possible allergies (modified to yummly's version)

Allergy.create(name: "Gluten-Free", yummly_allergy_id: "393^Gluten-Free")
Allergy.create(name: "Dairy-Free", yummly_allergy_id: "396^Dairy-Free")
Allergy.create(name: "Egg-Free", yummly_allergy_id: "397^Egg-Free")
Allergy.create(name: "Peanut-Free", yummly_allergy_id: "394^Peanut-Free")
Allergy.create(name: "Seafood-Free", yummly_allergy_id: "398^Seafood-Free")
Allergy.create(name: "Soy-Free", yummly_allergy_id: "400^Soy-Free")
Allergy.create(name: "Tree Nut-Free", yummly_allergy_id: "395^Tree Nut-Free")
Allergy.create(name: "Wheat-Free", yummly_allergy_id: "392^Wheat-Free")


# Associate the diets with appropriate ingredient types
# diet_vegetarian_id = Diet.find_by(name: "Vegetarian").id
# diet_lacto_vegetarian_id = Diet.find_by(name: "Lacto vegetarian").id
# diet_ovo_vegetarian_id = Diet.find_by(name: "Ovo vegetarian").id
# diet_vegan_id = Diet.find_by(name: "Vegan").id


# diet_dairy_free_id = Diet.find_by(name: "Dairy-Free").id
# diet_nut_free_id = Diet.find_by(name: "Nut-Free").id
# diet_pescatarian = Diet.find_by(name: "Pescatarian").id

# DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: egg_id)
# DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: dairy_id)

# DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: dairy_id)

# DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: egg_id)

# DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: fruit_id)

# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: meat_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: fish_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: shellfish_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: egg_id)
# DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: nuts_id)


# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: meat_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: fish_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: shellfish_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: egg_id)
# DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: dairy_id)

# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: fish_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: shellfish_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: vegetable_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: grain_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: fruit_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: egg_id)
# DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: dairy_id)

# # Create a few recipes with fixed ingredients and linkages
# Recipe.create(name: "Baked Eggs", 
# 	instructions: "1. Oven",
# 	prep_time: 15,
# 	meal_type: "Appetizer")

# Recipe.create(name: "Bacon Wrapped Scallop Skewers", 
# 	instructions: "1. Grill",
# 	prep_time: 15,
# 	meal_type: "Appetizer")

# Recipe.create(name: "Ratatouille", 
# 	instructions: "1. Oven",
# 	prep_time: 60,
# 	meal_type: "Entree")

# Recipe.create(name: "Cod Meuniere", 
# 	instructions: "1. Pan Fry",
# 	prep_time: 45,
# 	meal_type: "Entree")

# Recipe.create(name: "Apple and Pear Pie", 
# 	instructions: "1. Oven",
# 	prep_time: 30,
# 	meal_type: "Dessert")

# recipe_baked_eggs_id = Recipe.find_by(name: "Baked Eggs").id
# recipe_bacon_scallops_id = Recipe.find_by(name: "Bacon Wrapped Scallop Skewers").id
# recipe_ratatouille_id = Recipe.find_by(name: "Ratatouille").id
# recipe_cod_id = Recipe.find_by(name: "Cod Meuniere").id
# recipe_apple_pear_pie_id = Recipe.find_by(name: "Apple and Pear Pie").id

# Create the linkages
# RecipeIngredientQuantity.create(recipe_id: recipe_baked_eggs_id, ingredient_id: ingredient_large_eggs_id, quantity: 4, quantity_unit: "")
# RecipeIngredientQuantity.create(recipe_id: recipe_baked_eggs_id, ingredient_id: ingredient_bacon_id, quantity: 2, quantity_unit: "pieces")

# RecipeIngredientQuantity.create(recipe_id: recipe_bacon_scallops_id, ingredient_id: ingredient_bacon_id, quantity: 4, quantity_unit: "pieces")
# RecipeIngredientQuantity.create(recipe_id: recipe_bacon_scallops_id, ingredient_id: ingredient_scallops_id, quantity: 12, quantity_unit: "large")

# RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_tomatoes_id, quantity: 2, quantity_unit: "")
# RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_carrots_id, quantity: 4, quantity_unit: "")
# RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_broccoli_id, quantity: 1, quantity_unit: "head")
# RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_cauliflower_id, quantity: 1, quantity_unit: "head")

# RecipeIngredientQuantity.create(recipe_id: recipe_cod_id, ingredient_id: ingredient_cod_id, quantity: 8, quantity_unit: "oz")
# RecipeIngredientQuantity.create(recipe_id: recipe_cod_id, ingredient_id: ingredient_gruyere_cheese_id, quantity: 100, quantity_unit: "g")

# RecipeIngredientQuantity.create(recipe_id: recipe_apple_pear_pie_id, ingredient_id: ingredient_apple_id, quantity: 4, quantity_unit: "large")
# RecipeIngredientQuantity.create(recipe_id: recipe_apple_pear_pie_id, ingredient_id: ingredient_bartlett_pear_id, quantity: 4, quantity_unit: "small")

# Create the months
Month.create(name: "January")
Month.create(name: "February")
Month.create(name: "March")
Month.create(name: "April")
Month.create(name: "May")
Month.create(name: "June")
Month.create(name: "July")
Month.create(name: "August")
Month.create(name: "September")
Month.create(name: "October")
Month.create(name: "November")
Month.create(name: "December")

# Create the ingredient availabilities
# Fruit and Vegetables from http://www.ontario.ca/foodland/page/availability-guide

apples = Ingredient.create(name: "Apples", ingredient_type_id: fruit_id );
apples_month = [1,2,3,4,5,6,8,9,10,11,12]
apples_month.each do |month_id|
	apples.ingredient_availabilities.create(month_id: month_id)
end

apricots = Ingredient.create(name: "Apricots", ingredient_type_id: fruit_id );
apricots_month = [7,8]
apricots_month.each do |month_id|
	apricots.ingredient_availabilities.create(month_id: month_id)
end

blueberries = Ingredient.create(name: "Blueberries", ingredient_type_id: fruit_id );
blueberries_month = [7,8,9]
blueberries_month.each do |month_id|
	blueberries.ingredient_availabilities.create(month_id: month_id)
end

cherries = Ingredient.create(name: "Cherries", ingredient_type_id: fruit_id );
cherries_month = [6,7]
cherries_month.each do |month_id|
	cherries.ingredient_availabilities.create(month_id: month_id)
end

currants = Ingredient.create(name: "Currants", ingredient_type_id: fruit_id );
currants_month = [6,7]
currants_month.each do |month_id|
	currants.ingredient_availabilities.create(month_id: month_id)
end

grapes = Ingredient.create(name: "Grapes", ingredient_type_id: fruit_id );
grapes_month = [8,9]
grapes_month.each do |month_id|
	grapes.ingredient_availabilities.create(month_id: month_id)
end

peaches = Ingredient.create(name: "Peaches", ingredient_type_id: fruit_id );
peaches_month = [7,8,9]
peaches_month.each do |month_id|
	peaches.ingredient_availabilities.create(month_id: month_id)
end

rhubarb = Ingredient.create(name: "Rhubarb", ingredient_type_id: fruit_id );
rhubarb_month = [1,2,3,4,5,6]
rhubarb_month.each do |month_id|
	rhubarb.ingredient_availabilities.create(month_id: month_id)
end

artichoke = Ingredient.create(name: "Artichoke", ingredient_type_id: vegetable_id );
artichoke_month = [9,10,11]
artichoke_month.each do |month_id|
	artichoke.ingredient_availabilities.create(month_id: month_id)
end

asparagus = Ingredient.create(name: "Asparagus", ingredient_type_id: vegetable_id );
asparagus_month = [5,6]
asparagus_month.each do |month_id|
	asparagus.ingredient_availabilities.create(month_id: month_id)
end

beets = Ingredient.create(name: "Beets", ingredient_type_id: vegetable_id );
beets_month = [1,2,3,4,7,8,9,10,11,12]
beets_month.each do |month_id|
	beets.ingredient_availabilities.create(month_id: month_id)
end

broccoli = Ingredient.create(name: "Broccoli", ingredient_type_id: vegetable_id );
broccoli_month = [6,7,8,9,10]
broccoli_month.each do |month_id|
	broccoli.ingredient_availabilities.create(month_id: month_id)
end

carrots = Ingredient.create(name: "Carrots", ingredient_type_id: vegetable_id );
carrots_month = [1,2,3,4,5,7,8,9,10,11,12]
carrots_month.each do |month_id|
	carrots.ingredient_availabilities.create(month_id: month_id)
end

cauliflower = Ingredient.create(name: "Cauliflower", ingredient_type_id: vegetable_id );
cauliflower_month = [6,7,8,9,10,11]
cauliflower_month.each do |month_id|
	cauliflower.ingredient_availabilities.create(month_id: month_id)
end

corn = Ingredient.create(name: "Corn", ingredient_type_id: vegetable_id );
corn_month = [1,2,3,4,5,7,8,9,10,11,12]
corn_month.each do |month_id|
	corn.ingredient_availabilities.create(month_id: month_id)
end

eggplant = Ingredient.create(name: "Eggplant", ingredient_type_id: vegetable_id );
eggplant_month = [9,10,11]
eggplant_month.each do |month_id|
	eggplant.ingredient_availabilities.create(month_id: month_id)
end

garlic = Ingredient.create(name: "Garlic", ingredient_type_id: vegetable_id );
garlic_month = [1,2,7,8,9,10,11,12]
garlic_month.each do |month_id|
	garlic.ingredient_availabilities.create(month_id: month_id)
end

leeks = Ingredient.create(name: "Garlic", ingredient_type_id: vegetable_id );
garlic_month = [1,2,7,8,9,10,11,12]
garlic_month.each do |month_id|
	garlic.ingredient_availabilities.create(month_id: month_id)
end

mushrooms = Ingredient.create(name: "Mushrooms", ingredient_type_id: vegetable_id );
mushrooms_month = [1,2,3,4,5,6,7,8,9,10,11,12]
mushrooms_month.each do |month_id|
	mushrooms.ingredient_availabilities.create(month_id: month_id)
end

pumpkin = Ingredient.create(name: "Pumpkin", ingredient_type_id: vegetable_id );
pumpkin_month = [9,10]
pumpkin_month.each do |month_id|
	pumpkin.ingredient_availabilities.create(month_id: month_id)
end

radishes = Ingredient.create(name: "Radishes", ingredient_type_id: vegetable_id );
radishes_month = [5,6,7,8,9,10,11]
radishes_month.each do |month_id|
	radishes.ingredient_availabilities.create(month_id: month_id)
end

spinach = Ingredient.create(name: "Spinach", ingredient_type_id: vegetable_id );
spinach_month = [5,6,7,8,9,10]
spinach_month.each do |month_id|
	spinach.ingredient_availabilities.create(month_id: month_id)
end

squash = Ingredient.create(name: "Squash", ingredient_type_id: vegetable_id );
squash_month = [1,2,3,8,9,10,11,12]
squash_month.each do |month_id|
	squash.ingredient_availabilities.create(month_id: month_id)
end

tomatoes = Ingredient.create(name: "Tomatoes", ingredient_type_id: vegetable_id );
tomatoes_month = [7,8,9,10]
tomatoes_month.each do |month_id|
	tomatoes.ingredient_availabilities.create(month_id: month_id)
end

zucchini = Ingredient.create(name: "Zucchini", ingredient_type_id: vegetable_id );
zucchini_month = [7,8,9,10]
zucchini_month.each do |month_id|
	zucchini.ingredient_availabilities.create(month_id: month_id)
end

# Meat and Game from http://www.bbcgoodfood.com/seasonal-calendar/20046

# duck = Ingredient.create(name: "Duck", ingredient_type_id: meat_id );
# duck_month = [10,11,12]
# duck_month.each do |month_id|
# 	duck.ingredient_availabilities.create(month_id: month_id)
# end

# goose = Ingredient.create(name: "Goose", ingredient_type_id: meat_id );
# goose_month = [10,11,12]
# goose_month.each do |month_id|
# 	goose.ingredient_availabilities.create(month_id: month_id)
# end

# lamb = Ingredient.create(name: "Lamb", ingredient_type_id: meat_id );
# lamb_month = [1,2,3,4,5,6,7,8,9,10,11,12]
# lamb_month.each do |month_id|
# 	goose.ingredient_availabilities.create(month_id: month_id)
# end

# pork = Ingredient.create(name: "Pork", ingredient_type_id: meat_id );
# pork_month = [1,2,3,4,5,6,7,8,9,10,11,12]
# pork_month.each do |month_id|
# 	pork.ingredient_availabilities.create(month_id: month_id)
# end

# venison = Ingredient.create(name: "Venison", ingredient_type_id: meat_id );
# venison_month = [1,2,11,12]
# venison_month.each do |month_id|
# 	venison.ingredient_availabilities.create(month_id: month_id)
# end












