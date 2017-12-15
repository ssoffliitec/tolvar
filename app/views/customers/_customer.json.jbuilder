json.extract! customer, :id, :name, :adrress, :dni, :phone, :mobile, :mail, :created_at, :updated_at
json.url customer_url(customer, format: :json)
