json.extract! report, :id, :title, :contenido, :created_at, :updated_at
json.url report_url(report, format: :json)