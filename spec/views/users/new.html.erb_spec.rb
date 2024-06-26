# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'users/new' do
  before do
    assign(:user, User.new(
                    name: 'MyString',
                    email: 'MyString',
                    telefone: 'MyString',
                    profile: 1
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', administrate_users_path, 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[telefone]'

      assert_select 'input[name=?]', 'user[profile]'
    end
  end
end
