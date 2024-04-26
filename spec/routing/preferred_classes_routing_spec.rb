# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PreferredClassesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/preferred_classes').to route_to('preferred_classes#index')
    end

    it 'routes to #new' do
      expect(get: '/preferred_classes/new').to route_to('preferred_classes#new')
    end

    it 'routes to #show' do
      expect(get: '/preferred_classes/1').to route_to('preferred_classes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/preferred_classes/1/edit').to route_to('preferred_classes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/preferred_classes').to route_to('preferred_classes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/preferred_classes/1').to route_to('preferred_classes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/preferred_classes/1').to route_to('preferred_classes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/preferred_classes/1').to route_to('preferred_classes#destroy', id: '1')
    end
  end
end
