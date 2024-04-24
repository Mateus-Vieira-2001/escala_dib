# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'callback' do
    describe '#check_name' do
      context 'quando for adicionado um nome novo no cadastro' do
        let(:user_um) { create(:user, name: 'nome1') }
        let(:user_dois) { create(:user, name: 'nome2') }

        it 'retornar o nil' do
          expect(user_dois.check_name).to be_falsey
        end

        it 'verifica se os nomes são diferentes' do
          expect(user_dois.name).not_to eq('name1')
        end
      end

      context 'quando for adicionado um nome diferente no cadastro' do
        let(:user_um) { create(:user, name: 'nome1') }
        let(:user_dois) { build(:user, name: 'nome1') }

        it 'retornar falso' do
          user_dois.save
          expect(user_dois.check_name).to be_falsey
        end

        it 'verifica se os nomes são diferentes' do
          user_dois.save
          expect(user_dois.name).not_to eq('name1')
        end
      end
    end
  end
end
