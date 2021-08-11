# frozen_string_literal: true

FactoryBot.define do
  factory :npi do
    number { Faker::Number.number(digits: 10) }
    data { File.new('./spec/fixtures/npi_result.json') }
  end
end
