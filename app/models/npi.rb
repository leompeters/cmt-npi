# frozen_string_literal: true

class Npi < ApplicationRecord
  validates :number, presence: true,
                     uniqueness: true,
                     length: { is: 10 },
                     numericality: { only_integer: true }
end
