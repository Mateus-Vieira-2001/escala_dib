# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_classes/index' do
  before do
    assign(:preferred_classes, [
             PreferredClass.create!(
               description: 'Description'
             ),
             PreferredClass.create!(
               description: 'Description'
             )
           ])
  end

  it 'renders a list of preferred_classes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
  end
end
