json.array!(@books) do |book|
  json.extract! book, :id, :bk_title, :bk_isbn, :bk_author
  json.url book_url(book, format: :json)
end
