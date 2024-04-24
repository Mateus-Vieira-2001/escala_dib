# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'type_profiles/index' do
  before do
    assign(:type_profiles, [
             TypeProfile.create!(
               description: 'Description'
             ),
             TypeProfile.create!(
               description: 'Description'
             )
           ])
  end

  it 'renders a list of type_profiles' do
    render
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
  end
end
