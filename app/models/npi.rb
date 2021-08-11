# frozen_string_literal: true

class Npi < ApplicationRecord
  validates :number, identifier: true, on: :create
  validates :number, presence: true, uniqueness: true
  # The below validations are handled by the +IdentifierValidator+.
  # length: { is: 10 },
  # numericality: { only_integer: true }
end
