json.array!(@user_favourite_shops) do |user_favourite_shop|
  json.extract! user_favourite_shop, :id, :user_id, :shop_id
  json.url user_favourite_shop_url(user_favourite_shop, format: :json)
end
