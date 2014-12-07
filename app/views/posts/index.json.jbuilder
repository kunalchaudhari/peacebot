json.array!(@posts) do |post|
  json.extract! post, :id, :content, :password, :anonymous, :ip_address
  json.url post_url(post, format: :json)
end
