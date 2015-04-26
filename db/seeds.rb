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
Ingredient.create(name: "Chicken", ingredient_type_id: meat_id );
Ingredient.create(name: "Chuck Roast Beef", ingredient_type_id: meat_id );
Ingredient.create(name: "Bacon", ingredient_type_id: meat_id );
Ingredient.create(name: "Salmon", ingredient_type_id: fish_id );
Ingredient.create(name: "Cod", ingredient_type_id: fish_id );
Ingredient.create(name: "Scallops", ingredient_type_id: shellfish_id  );
Ingredient.create(name: "Shrimp", ingredient_type_id: shellfish_id );
Ingredient.create(name: "Lobster", ingredient_type_id: shellfish_id  );
Ingredient.create(name: "Tomatoes", ingredient_type_id: vegetable_id  );
Ingredient.create(name: "Carrots", ingredient_type_id: vegetable_id );
Ingredient.create(name: "Potatoes", ingredient_type_id: vegetable_id );
Ingredient.create(name: "Kale", ingredient_type_id: vegetable_id );
Ingredient.create(name: "Broccoli", ingredient_type_id: vegetable_id );
Ingredient.create(name: "Cauliflower", ingredient_type_id: vegetable_id );
Ingredient.create(name: "Brown Rice", ingredient_type_id: grain_id );
Ingredient.create(name: "Quinoa", ingredient_type_id: grain_id );
Ingredient.create(name: "Apples", ingredient_type_id: fruit_id );
Ingredient.create(name: "Oranges", ingredient_type_id: fruit_id );
Ingredient.create(name: "Bartlett Pear", ingredient_type_id: fruit_id );
Ingredient.create(name: "Milk", ingredient_type_id: dairy_id );
Ingredient.create(name: "Whipping Cream", ingredient_type_id: dairy_id );
Ingredient.create(name: "Gruyere Cheese", ingredient_type_id: dairy_id );
Ingredient.create(name: "Large Eggs", ingredient_type_id: egg_id );
Ingredient.create(name: "Egg White", ingredient_type_id: egg_id );
Ingredient.create(name: "Almonds", ingredient_type_id: nuts_id );
Ingredient.create(name: "Pecans", ingredient_type_id: nuts_id );
Ingredient.create(name: "Nutella", ingredient_type_id: nuts_id );

ingredient_bacon_id = Ingredient.find_by(name: "Bacon").id
ingredient_cod_id = Ingredient.find_by(name: "Cod").id
ingredient_scallops_id = Ingredient.find_by(name: "Scallops").id
ingredient_tomatoes_id = Ingredient.find_by(name: "Tomatoes").id
ingredient_carrots_id = Ingredient.find_by(name: "Carrots").id
ingredient_broccoli_id = Ingredient.find_by(name: "Broccoli").id
ingredient_cauliflower_id = Ingredient.find_by(name: "Cauliflower").id
ingredient_apple_id = Ingredient.find_by(name: "Apples").id
ingredient_bartlett_pear_id = Ingredient.find_by(name: "Bartlett Pear").id
ingredient_gruyere_cheese_id = Ingredient.find_by(name: "Gruyere Cheese").id
ingredient_large_eggs_id = Ingredient.find_by(name: "Large Eggs").id


# Create the possible diets (modified to yummly's version)
Diet.create(name: "Vegetarian", yummly_diet_id: "387^Lacto-ovo vegetarian")
Diet.create(name: "Vegan", yummly_diet_id: "386^Vegan")
Diet.create(name: "Pescetarian", yummly_diet_id: "390^Pescetarian")
Diet.create(name: "Paleo", yummly_diet_id: "403^Paleo")
Diet.create(name: "Ovo vegetarian", yummly_diet_id:"389^Ovo vegetarian")
Diet.create(name: "Lacto vegetarian", yummly_diet_id:"388^Lacto vegetarian")

# Associate the diets with appropriate ingredient types
diet_vegetarian_id = Diet.find_by(name: "Vegetarian").id
diet_lacto_vegetarian_id = Diet.find_by(name: "Lacto vegetarian").id
diet_ovo_vegetarian_id = Diet.find_by(name: "Ovo vegetarian").id
diet_vegan_id = Diet.find_by(name: "Vegan").id


diet_dairy_free_id = Diet.find_by(name: "Dairy-Free").id
diet_nut_free_id = Diet.find_by(name: "Nut-Free").id
diet_pescatarian = Diet.find_by(name: "Pescatarian").id

DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: egg_id)
DietIngredientType.create(diet_id: diet_vegetarian_id, ingredient_type_id: dairy_id)

DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_lacto_vegetarian_id, ingredient_type_id: dairy_id)

DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_ovo_vegetarian_id, ingredient_type_id: egg_id)

DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_vegan_id, ingredient_type_id: fruit_id)

DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: meat_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: fish_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: shellfish_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: egg_id)
DietIngredientType.create(diet_id: diet_dairy_free_id, ingredient_type_id: nuts_id)


DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: meat_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: fish_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: shellfish_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: egg_id)
DietIngredientType.create(diet_id: diet_nut_free_id, ingredient_type_id: dairy_id)

DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: fish_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: shellfish_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: vegetable_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: grain_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: fruit_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: egg_id)
DietIngredientType.create(diet_id: diet_pescatarian, ingredient_type_id: dairy_id)

# Create a few recipes with fixed ingredients and linkages
Recipe.create(name: "Baked Eggs", 
	instructions: "1. Oven",
	prep_time: 15,
	meal_type: "Appetizer")

Recipe.create(name: "Bacon Wrapped Scallop Skewers", 
	instructions: "1. Grill",
	prep_time: 15,
	meal_type: "Appetizer")

Recipe.create(name: "Ratatouille", 
	instructions: "1. Oven",
	prep_time: 60,
	meal_type: "Entree")

Recipe.create(name: "Cod Meuniere", 
	instructions: "1. Pan Fry",
	prep_time: 45,
	meal_type: "Entree")

Recipe.create(name: "Apple and Pear Pie", 
	instructions: "1. Oven",
	prep_time: 30,
	meal_type: "Dessert")

recipe_baked_eggs_id = Recipe.find_by(name: "Baked Eggs").id
recipe_bacon_scallops_id = Recipe.find_by(name: "Bacon Wrapped Scallop Skewers").id
recipe_ratatouille_id = Recipe.find_by(name: "Ratatouille").id
recipe_cod_id = Recipe.find_by(name: "Cod Meuniere").id
recipe_apple_pear_pie_id = Recipe.find_by(name: "Apple and Pear Pie").id

# Create the linkages
RecipeIngredientQuantity.create(recipe_id: recipe_baked_eggs_id, ingredient_id: ingredient_large_eggs_id, quantity: 4, quantity_unit: "")
RecipeIngredientQuantity.create(recipe_id: recipe_baked_eggs_id, ingredient_id: ingredient_bacon_id, quantity: 2, quantity_unit: "pieces")

RecipeIngredientQuantity.create(recipe_id: recipe_bacon_scallops_id, ingredient_id: ingredient_bacon_id, quantity: 4, quantity_unit: "pieces")
RecipeIngredientQuantity.create(recipe_id: recipe_bacon_scallops_id, ingredient_id: ingredient_scallops_id, quantity: 12, quantity_unit: "large")

RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_tomatoes_id, quantity: 2, quantity_unit: "")
RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_carrots_id, quantity: 4, quantity_unit: "")
RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_broccoli_id, quantity: 1, quantity_unit: "head")
RecipeIngredientQuantity.create(recipe_id: recipe_ratatouille_id, ingredient_id: ingredient_cauliflower_id, quantity: 1, quantity_unit: "head")

RecipeIngredientQuantity.create(recipe_id: recipe_cod_id, ingredient_id: ingredient_cod_id, quantity: 8, quantity_unit: "oz")
RecipeIngredientQuantity.create(recipe_id: recipe_cod_id, ingredient_id: ingredient_gruyere_cheese_id, quantity: 100, quantity_unit: "g")

RecipeIngredientQuantity.create(recipe_id: recipe_apple_pear_pie_id, ingredient_id: ingredient_apple_id, quantity: 4, quantity_unit: "large")
RecipeIngredientQuantity.create(recipe_id: recipe_apple_pear_pie_id, ingredient_id: ingredient_bartlett_pear_id, quantity: 4, quantity_unit: "small")

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
