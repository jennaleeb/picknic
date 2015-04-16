json.array!(@web_infos) do |web_info|
  json.extract! web_info, :id, :email, :website, :facebook, :twitter, :shop_id
  json.url web_info_url(web_info, format: :json)
end
