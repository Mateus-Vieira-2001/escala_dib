# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Welcomes' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/welcome/index'
      expect(response).to have_http_status(:success)
    end
  end
end
