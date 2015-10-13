json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :user_id, :friend_id, :status, :created_at, :accepted_at
  json.url friendship_url(friendship, format: :json)
end
