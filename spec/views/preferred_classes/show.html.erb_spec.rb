# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_classes/show' do
  before do
    assign(:preferred_class, PreferredClass.create!(
                               description: 'Description'
                             ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Description/)
  end
end
