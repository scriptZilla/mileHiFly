json.array!(@products) do |product|
  json.extract! product, :id, :name, :insect_type, :time_of_year, :fish, :description
  json.url product_url(product, format: :json)
end
