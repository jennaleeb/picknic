json.array!(@diet_ingredient_types) do |diet_ingredient_type|
  json.extract! diet_ingredient_type, :id, :diet_id, :ingredient_type_id
  json.url diet_ingredient_type_url(diet_ingredient_type, format: :json)
end
