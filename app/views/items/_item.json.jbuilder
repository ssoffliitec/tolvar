json.extract! item, :id, :code, :description, :marca_id, :unit_id, :category_id, :stock, :min_stock, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
