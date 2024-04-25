# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_days/index' do
  before do
    assign(:preferred_days, [
             PreferredDay.create!(
               description: 'Description'
             ),
             PreferredDay.create!(
               description: 'Description'
             )
           ])
  end

  it 'renders a list of preferred_days' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
  end
end
