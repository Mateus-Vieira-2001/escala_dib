# frozen_string_literal: true

class UserPreferredClass < ApplicationRecord
  belongs_to :user
  belongs_to :preferred_class
end
