json.array!(@user_favourite_recipes) do |user_favourite_recipe|
  json.extract! user_favourite_recipe, :id, :user_id, :recipe_id
  json.url user_favourite_recipe_url(user_favourite_recipe, format: :json)
end
