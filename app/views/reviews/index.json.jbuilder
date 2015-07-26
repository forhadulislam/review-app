json.array!(@reviews) do |review|
  json.extract! review, :id, :category_id, :sub_category_id, :title, :slug, :score, :price, :features, :support, :short_description, :first_paragraph, :second_paragraph, :third_paragraph, :top_features, :lowest_price, :image, :url, :total_viewed, :is_published, :is_featured
  json.url review_url(review, format: :json)
end
