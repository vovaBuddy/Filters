json.array!(@lengths) do |length|
  json.extract! length, :id, :name, :dress_id
  json.url length_url(length, format: :json)
end
