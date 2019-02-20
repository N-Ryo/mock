json.extract! comment, :id, :feeling, :content, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
