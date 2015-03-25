json.array!(@ingredient_types) do |ingredient_type|
  json.extract! ingredient_type, :id, :name
  json.url ingredient_type_url(ingredient_type, format: :json)
end
