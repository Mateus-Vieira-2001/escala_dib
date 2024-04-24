# frozen_string_literal: true

class AddColumnsLeaderToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :leader, :boolean, null: false, default: false
  end
end
