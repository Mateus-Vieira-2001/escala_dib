# frozen_string_literal: true

# Migration to add an index to the name column in the users table
class AddindexToNameInTableUser < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :name, unique: true
  end
end
