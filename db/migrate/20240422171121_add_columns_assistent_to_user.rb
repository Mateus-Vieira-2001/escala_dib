# frozen_string_literal: true

class AddColumnsAssistentToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :assistent, :boolean, null: false, default: false
  end
end
