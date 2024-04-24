# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :type_profile
end
