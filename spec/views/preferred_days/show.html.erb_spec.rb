# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_days/show' do
  before do
    assign(:preferred_day, PreferredDay.create!(
                             description: 'Description'
                           ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Description/)
  end
end
