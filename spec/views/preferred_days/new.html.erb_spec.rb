# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_days/new' do
  before do
    assign(:preferred_day, PreferredDay.new(
                             description: 'MyString'
                           ))
  end

  it 'renders new preferred_day form' do
    render

    assert_select 'form[action=?][method=?]', preferred_days_path, 'post' do
      assert_select 'input[name=?]', 'preferred_day[description]'
    end
  end
end
