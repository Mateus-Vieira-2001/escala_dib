# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'preferred_classes/new' do
  before do
    assign(:preferred_class, PreferredClass.new(
                               description: 'MyString'
                             ))
  end

  it 'renders new preferred_class form' do
    render

    assert_select 'form[action=?][method=?]', preferred_classes_path, 'post' do
      assert_select 'input[name=?]', 'preferred_class[description]'
    end
  end
end
