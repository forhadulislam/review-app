json.array!(@categories) do |category|
  json.extract! category, :id, :title, :total_viewed, :image
  json.url category_url(category, format: :json)
end
