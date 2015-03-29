json.array!(@recipe_ingredient_quantities) do |recipe_ingredient_quantity|
  json.extract! recipe_ingredient_quantity, :id, :recipe_id, :ingredient_id, :quantity, :quantity_unit
  json.url recipe_ingredient_quantity_url(recipe_ingredient_quantity, format: :json)
end
