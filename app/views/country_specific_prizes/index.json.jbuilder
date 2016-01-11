json.array!(@country_specific_prizes) do |country_specific_prize|
  json.extract! country_specific_prize, :id, :scaffold, :amount, :status, :user_id, :country_id
  json.url country_specific_prize_url(country_specific_prize, format: :json)
end
