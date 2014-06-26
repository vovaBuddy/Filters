json.array!(@dress_types) do |dress_type|
  json.extract! dress_type, :id, :name, :dress_id
  json.url dress_type_url(dress_type, format: :json)
end
