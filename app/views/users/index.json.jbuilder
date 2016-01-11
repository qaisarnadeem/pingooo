json.array!(@users) do |user|
  json.extract! user, :id, :nickname, :email, :firstName, :lastName, :references, :date_of_birth, :diamond_count, :language
  json.url user_url(user, format: :json)
end
