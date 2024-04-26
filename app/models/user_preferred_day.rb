# frozen_string_literal: true

class UserPreferedDay < ApplicationRecord
  belongs_to :user
  belongs_to :preferred_day
end
