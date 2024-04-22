# frozen_string_literal: true

class AddColumnDayPreferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :preferred_day, :integer
    add_column :users, :preferred_class, :integer
  end
end
