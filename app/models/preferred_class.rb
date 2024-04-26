# frozen_string_literal: true

class PreferredClass < ApplicationRecord
  has_many :user_preferred_classes, dependent: :destroy
  has_many :users, through: :user_preferred_classes

  scope :kids1, -> { find_by(description: 'Kids1') }
  scope :kids2, -> { find_by(description: 'Kids2') }
  scope :kids, -> { find_by(description: 'Kids') }
  scope :pre1, -> { find_by(description: 'Pre1') }
  scope :pre2, -> { find_by(description: 'Pre2') }
  scope :pre, -> { find_by(description: 'Pre') }
  scope :babies, -> { find_by(description: 'Babies') }
  scope :teens1, -> { find_by(description: 'Teens1') }
  scope :teens2, -> { find_by(description: 'Teens2') }
  scope :teens, -> { find_by(description: 'Teens') }
end
