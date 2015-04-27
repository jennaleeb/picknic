json.array!(@contact_infos) do |contact_info|
  json.extract! contact_info, :id, :shop_id, :telephone_number, :fax_number
  json.url contact_info_url(contact_info, format: :json)
end
