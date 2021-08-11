# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Npi, type: :model do
  subject { build(:npi) }

  context 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }
    # https://github.com/thoughtbot/shoulda-matchers/issues/970#issuecomment-292345134
    # it { should validate_length_of(:number).is_equal_to(10) }
    # it { should validate_numericality_of(:number).only_integer }
  end
end
