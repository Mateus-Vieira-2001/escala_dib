# frozen_string_literal: true

class CreateUserPreferredClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_preferred_classes, &:timestamps
  end
end
