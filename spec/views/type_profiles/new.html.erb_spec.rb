# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'type_profiles/new' do
  before do
    assign(:type_profile, TypeProfile.new(
                            description: 'MyString'
                          ))
  end

  it 'renders new type_profile form' do
    render

    assert_select 'form[action=?][method=?]', type_profiles_path, 'post' do
      assert_select 'input[name=?]', 'type_profile[description]'
    end
  end
end
