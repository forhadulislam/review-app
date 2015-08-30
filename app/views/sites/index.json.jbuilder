json.array!(@sites) do |site|
  json.extract! site, :id, :title, :description, :url, :next_url, :image, :meta_tags, :analytics
  json.url site_url(site, format: :json)
end
