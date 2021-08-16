# frozen_string_literal: true

class Npi < ApplicationRecord
  module WithData
    extend ActiveSupport::Concern

    included do
      # Showing this way to access the json stored in the +data+ attribute.
      jsonb_accessor :data, addresses: :jsonb,
                            taxonomies: :jsonb

      def name
        data.dig('basic', 'name')
      end

      def enumeration_type
        data['enumeration_type']
      end

      def full_addresses
        addresses.map do |address|
          addr_1, addr_2, city, state, zip, country =
            address.values_at('address_1', 'address_2', 'city', 'state', 'postal_code', 'country_code')
          "#{addr_1} #{addr_2}, #{city}, #{state} #{zip}, #{country}".gsub(/\s,/, ',')
        end
      end
    end
  end
end
