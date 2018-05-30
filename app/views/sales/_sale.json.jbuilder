json.extract! sale, :id, :user_id, :company_id, :neto, :neto_iva, :total_compra, :created_at, :updated_at
json.url sale_url(sale, format: :json)
