# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type.model do
  describe 'callback' do
    describe '#check_name' do
      before { create(:user, name: 'nome1') }

      context 'quando for adicionado um nome novo no cadastro' do
        it 'retornar o nome se for diferente' do
          user2 = build(:user, name: 'nome2')
          user2.save
          expect(described_class.check_name).to eq(name)
        end
      end
    end
  end
end
