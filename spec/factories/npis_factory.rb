# frozen_string_literal: true

FactoryBot.define do
  factory :npi do
    number { Faker::Number.number(digits: 10) }
    data do
      {
        number: number,
        basic: {
          first_name: Faker::Name.first_name,
          middle_name: Faker::Name.middle_name,
          last_name: Faker::Name.last_name
        },
        addresses: [
          {
            address_1: Faker::Address.street_address,
            address_2: Faker::Address.secondary_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            postal_code: Faker::Address.postcode
          }
        ]
      }
    end # file_fixture('npi.json').read
  end
end
