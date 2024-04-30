# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'type_profiles/show' do
  before do
    @type_profile = assign(:type_profile, TypeProfile.create!(
                                            description: 'Description'
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Description/)
  end
end
