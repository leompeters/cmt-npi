# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NpisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/npis').to route_to('npis#index')
    end

    it 'routes to #create' do
      expect(post: '/npis').to route_to('npis#create')
    end
  end
end
