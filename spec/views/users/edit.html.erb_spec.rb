# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit' do
  before do
    @user = assign(:user, User.create!(
                            name: 'MyString',
                            email: 'MyString',
                            telefone: 'MyString',
                            profile: 1
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[telefone]'

      assert_select 'input[name=?]', 'user[profile]'
    end
  end
end
