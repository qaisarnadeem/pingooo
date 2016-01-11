json.array!(@country_specific_prizes) do |country_specific_prize|
  json.extract! country_specific_prize, :id, :refrences, :references, :amount, :status
  json.url country_specific_prize_url(country_specific_prize, format: :json)
end
