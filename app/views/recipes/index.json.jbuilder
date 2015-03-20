json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :instructions, :prep_time, :meal_type
  json.url recipe_url(recipe, format: :json)
end
