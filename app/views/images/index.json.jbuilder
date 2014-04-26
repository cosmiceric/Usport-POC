json.array!(@images) do |image|
  json.extract! image, :name
  json.url image_url(image, format: :json)
end
