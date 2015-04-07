json.array!(@dietary_preferences) do |dietary_preference|
  json.extract! dietary_preference, :id, :user_id
  json.url dietary_preference_url(dietary_preference, format: :json)
end
