# frozen_string_literal: true

class CreateUserPreferredDays < ActiveRecord::Migration[7.1]
  def change
    create_table :user_preferred_days, &:timestamps
  end
end
