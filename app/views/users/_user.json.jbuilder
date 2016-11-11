json.extract! user, :id, :token, :email, :access_type, :character_id, :created_at, :updated_at
json.url user_url(user, format: :json)