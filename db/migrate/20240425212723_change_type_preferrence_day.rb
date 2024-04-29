# frozen_string_literal: true

class ChangeTypePreferrenceDay < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :preferred_day, :string
    change_column :users, :preferred_class, :string
  end
end
