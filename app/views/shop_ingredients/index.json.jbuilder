json.array!(@shop_ingredients) do |shop_ingredient|
  json.extract! shop_ingredient, :id, :shop_id, :ingredients_id
  json.url shop_ingredient_url(shop_ingredient, format: :json)
end
