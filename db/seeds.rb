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












