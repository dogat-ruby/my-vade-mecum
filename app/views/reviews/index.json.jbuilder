json.array!(@reviews) do |review|
  json.extract! review, :id, :text, :user_id, :book_id
  json.url review_url(review, format: :json)
end
