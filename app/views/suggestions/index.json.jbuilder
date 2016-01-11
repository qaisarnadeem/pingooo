json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :references, :subject, :description
  json.url suggestion_url(suggestion, format: :json)
end
