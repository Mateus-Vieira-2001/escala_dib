# frozen_string_literal: true

class CreateUserPrefferedDays < ActiveRecord::Migration[7.1]
  def change
    create_table :user_preffered_days, &:timestamps
  end
end
