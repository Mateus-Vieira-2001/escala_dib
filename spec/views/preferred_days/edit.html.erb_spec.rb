# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_days/edit' do
  let(:preferred_day) do
    PreferredDay.create!(
      description: 'MyString'
    )
  end

  before do
    assign(:preferred_day, preferred_day)
  end

  it 'renders the edit preferred_day form' do
    render

    assert_select 'form[action=?][method=?]', preferred_day_path(preferred_day), 'post' do
      assert_select 'input[name=?]', 'preferred_day[description]'
    end
  end
end
