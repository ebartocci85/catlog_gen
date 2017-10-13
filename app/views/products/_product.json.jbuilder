json.extract! product, :id, :upc, :sku, :brand, :size, :currency, :retail, :wholesale, :img_url, :created_at, :updated_at
json.url product_url(product, format: :json)
