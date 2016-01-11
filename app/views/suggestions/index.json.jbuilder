json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :user_id, :subject, :description
  json.url suggestion_url(suggestion, format: :json)
end
