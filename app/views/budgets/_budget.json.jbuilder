json.extract! budget, :id, :number, :date, :state, :customer_id, :created_at, :updated_at
json.url budget_url(budget, format: :json)
