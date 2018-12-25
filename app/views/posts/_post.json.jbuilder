json.extract! post, :id, :name, :title, :content, :description, :visibility, :published_date, :status, :importance, :rating, :created_at, :updated_at
json.url post_url(post, format: :json)
