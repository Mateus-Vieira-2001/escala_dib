# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_profiles, &:timestamps
  end
end
