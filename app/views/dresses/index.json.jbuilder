json.array!(@dresses) do |dress|
  json.extract! dress, :id, :name, :brand, :image, :price, :type, :color, :length
  json.url dress_url(dress, format: :json)
end
