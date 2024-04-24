# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'callback' do
    describe '#check_name' do
      before { create(:user, name: 'nome1') }

      context 'quando for adicionado um nome novo no cadastro' do
        it 'retornar o nome se for diferente' do
          create(:user, name: 'nome2')
          expect(described_class.check_name).to eq(name)
        end
      end
    end
  end
end
