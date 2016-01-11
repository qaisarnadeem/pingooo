json.array!(@prize_redemptions) do |prize_redemption|
  json.extract! prize_redemption, :id, :user_id, :game_id, :country_specific_prize_id, :status
  json.url prize_redemption_url(prize_redemption, format: :json)
end
