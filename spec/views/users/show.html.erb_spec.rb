# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'users/show' do
  before do
    @user = assign(:user, User.create!(
                            name: 'Name',
                            email: 'Email',
                            telefone: 'Telefone',
                            profile: 2
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/2/)
  end
end
