# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypeProfilesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/type_profiles').to route_to('type_profiles#index')
    end

    it 'routes to #new' do
      expect(get: '/type_profiles/new').to route_to('type_profiles#new')
    end

    it 'routes to #show' do
      expect(get: '/type_profiles/1').to route_to('type_profiles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/type_profiles/1/edit').to route_to('type_profiles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/type_profiles').to route_to('type_profiles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/type_profiles/1').to route_to('type_profiles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/type_profiles/1').to route_to('type_profiles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/type_profiles/1').to route_to('type_profiles#destroy', id: '1')
    end
  end
end
