# frozen_string_literal: true

json.extract! npi, :id, :number, :data, :created_at, :updated_at
json.url npi_url(npi, format: :json)
