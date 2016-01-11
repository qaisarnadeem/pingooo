json.array!(@gameplays) do |gameplay|
  json.extract! gameplay, :id, :postion_x, :position_y, :game_id, :user_id, :chance_number, :is_hit
  json.url gameplay_url(gameplay, format: :json)
end
