# frozen_string_literal: true

class PreferredDay < ApplicationRecord
  has_many :user_preferred_days, dependent: :destroy
  has_many :users, through: :user_preferred_days

  scope :sunday, -> { find_by(description: 'Domingo') }
  scope :sunday_morning, -> { find_by(description: 'Domingo de manhã') }
  scope :sunday_evening, -> { find_by(description: 'Domingo de noite') }
  scope :monday, -> { find_by(description: 'Segunda') }
  scope :tuesday, -> { find_by(description: 'Terça Feira') }
  scope :wednesday, -> { find_by(description: 'Quarta Feira') }
  scope :thursday, -> { find_by(description: 'Quinta Feira') }
end
