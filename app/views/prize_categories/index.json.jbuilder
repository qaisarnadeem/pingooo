json.array!(@prize_categories) do |prize_category|
  json.extract! prize_category, :id, :title, :description, :amount
  json.url prize_category_url(prize_category, format: :json)
end
