# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'users/index' do
  before do
    assign(:users, [
             User.create!(
               name: 'Name',
               email: 'Email',
               telefone: 'Telefone',
               profile: 2
             ),
             User.create!(
               name: 'Name',
               email: 'Email',
               telefone: 'Telefone',
               profile: 2
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Telefone'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
