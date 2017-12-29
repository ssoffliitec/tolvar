json.extract! sale, :id, :number, :date, :state, :customer_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
