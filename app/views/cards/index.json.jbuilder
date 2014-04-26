json.array!(@cards) do |card|
  json.extract! card, :first_name, :last_name, :team_id, :sport_id, :date_of_birth, :height, :weight, :jersey_number, :throws, :bats
  json.url card_url(card, format: :json)
end
