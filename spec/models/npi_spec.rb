# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Npi, type: :model do
  subject { create(:npi) }

  context 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }
  end
end
