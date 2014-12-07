json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :about
  json.url user_url(user, format: :json)
end
