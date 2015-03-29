json.array!(@shopping_list_items) do |shopping_list_item|
  json.extract! shopping_list_item, :id, :done, :shopping_list_id, :recipe_ingredient_quantity_id
  json.url shopping_list_item_url(shopping_list_item, format: :json)
end
