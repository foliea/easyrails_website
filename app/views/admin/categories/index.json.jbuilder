json.array!(@categories) do |category|
  json.extract! category, :name, :order, :published
  json.url category_url(category, format: :json)
end