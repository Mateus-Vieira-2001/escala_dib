# frozen_string_literal: true

class ChangeColumProfile < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :profile, :string
  end
end
