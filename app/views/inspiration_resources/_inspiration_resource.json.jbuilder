json.extract! inspiration_resource, :id, :title, :url, :category, :created_at, :updated_at
json.url inspiration_resource_url(inspiration_resource, format: :json)
