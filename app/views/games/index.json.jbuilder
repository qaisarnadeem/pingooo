json.array!(@games) do |game|
  json.extract! game, :id, :title, :position_x, :position_y, :position_offset, :number_of_winners, :status
  json.url game_url(game, format: :json)
end
