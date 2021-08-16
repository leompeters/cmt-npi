# frozen_string_literal: true

class Npi < ApplicationRecord
  include WithData

  scope :ordered, -> { order(updated_at: :desc) }

  validates :number, identifier: true, on: :create
  validates :number, presence: true, uniqueness: true
  # The below validations are handled by the +IdentifierValidator+.
  # length: { is: 10 },
  # numericality: { only_integer: true }
end
