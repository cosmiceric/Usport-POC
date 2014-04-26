json.array!(@sports) do |sport|
  json.extract! sport, :name
  json.url sport_url(sport, format: :json)
end
