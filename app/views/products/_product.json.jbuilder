json.extract! product, :id, :nombre, :descripcion, :cantidad, :precio_compra, :precio_venta, :created_at, :updated_at
json.url product_url(product, format: :json)
