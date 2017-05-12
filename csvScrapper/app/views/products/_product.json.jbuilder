json.extract! product, :id, :EAN, :MARQUE, :REF_FABRICANT, :CATEGORIES, :NOM_PRODUIT, :created_at, :updated_at
json.url product_url(product, format: :json)
