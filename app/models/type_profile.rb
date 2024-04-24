# frozen_string_literal: true

# Model TypeProfile
class TypeProfile < ApplicationRecord
  has_many :user_profiles, dependent: :destroy
  has_many :user, through: :user_profiles

  scope :teacher, -> { find_by(name: 'Professor') }
  scope :assistent, -> { find_by(description: 'Auxiliar') }
  scope :leader, -> { find_by(description: 'Líder') }
  scope :teacher_assistent, -> { find_by(description: 'Professor e Auxiliar') }
  scope :leader_assistent, -> { find_by(description: 'Líder e Auxiliar') }
  scope :leader_teacher, -> { find_by(description: 'Líder e Professor') }
  scope :assistent_leader, -> { find_by(name: 'Assistente do Líder') }
end
