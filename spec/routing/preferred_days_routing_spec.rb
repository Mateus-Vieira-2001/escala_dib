# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PreferredDaysController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/preferred_days').to route_to('preferred_days#index')
    end

    it 'routes to #new' do
      expect(get: '/preferred_days/new').to route_to('preferred_days#new')
    end

    it 'routes to #show' do
      expect(get: '/preferred_days/1').to route_to('preferred_days#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/preferred_days/1/edit').to route_to('preferred_days#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/preferred_days').to route_to('preferred_days#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/preferred_days/1').to route_to('preferred_days#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/preferred_days/1').to route_to('preferred_days#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/preferred_days/1').to route_to('preferred_days#destroy', id: '1')
    end
  end
end
