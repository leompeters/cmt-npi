# frozen_string_literal: true

json.array! @npis, partial: 'npis/npi', as: :npi
