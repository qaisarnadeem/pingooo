json.array!(@users) do |user|
  json.extract! user, :id, :nickname, :email, :first_name, :last_name, :country_id, :date_of_birth, :diamond_count, :language, :secret_code
  json.url user_url(user, format: :json)
end
