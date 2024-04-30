# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associaçoes' do
    it { is_expected.to have_many(:teacher_name).class_name('Schedule').with_foreign_key('teacher_id') }
    it { is_expected.to have_many(:leader_name).class_name('Schedule').with_foreign_key('leader_id') }
    it { is_expected.to have_many(:assistent_name).class_name('Schedule').with_foreign_key('assistent_id') }
  end

  describe 'validacoes' do
    it { is_expected.to validates_uniqueness_of }
  end

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
