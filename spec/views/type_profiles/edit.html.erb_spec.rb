# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'type_profiles/edit' do
  before do
    @type_profile = assign(:type_profile, TypeProfile.create!(
                                            description: 'MyString'
                                          ))
  end

  it 'renders the edit type_profile form' do
    render

    assert_select 'form[action=?][method=?]', type_profile_path(@type_profile), 'post' do
      assert_select 'input[name=?]', 'type_profile[description]'
    end
  end
end
