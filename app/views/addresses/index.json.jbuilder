json.array!(@addresses) do |address|
  json.extract! address, :id, :address_line1, :address_line2, :city, :province, :country, :postal_code, :shop_id
  json.url address_url(address, format: :json)
end
