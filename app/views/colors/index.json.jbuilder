json.array!(@colors) do |color|
  json.extract! color, :id, :name, :dress_id
  json.url color_url(color, format: :json)
end
