# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_classes/edit' do
  let(:preferred_class) do
    PreferredClass.create!(
      description: 'MyString'
    )
  end

  before do
    assign(:preferred_class, preferred_class)
  end

  it 'renders the edit preferred_class form' do
    render

    assert_select 'form[action=?][method=?]', preferred_class_path(preferred_class), 'post' do
      assert_select 'input[name=?]', 'preferred_class[description]'
    end
  end
end
