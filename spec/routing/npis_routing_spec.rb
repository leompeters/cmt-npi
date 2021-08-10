# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NpisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/npis').to route_to('npis#index')
    end

    it 'routes to #new' do
      expect(get: '/npis/new').to route_to('npis#new')
    end

    it 'routes to #show' do
      expect(get: '/npis/1').to route_to('npis#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/npis/1/edit').to route_to('npis#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/npis').to route_to('npis#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/npis/1').to route_to('npis#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/npis/1').to route_to('npis#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/npis/1').to route_to('npis#destroy', id: '1')
    end
  end
end
