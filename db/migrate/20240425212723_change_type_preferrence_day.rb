# frozen_string_literal: true

class ChangeTypePreferrenceDay < ActiveRecord::Migration[7.1]
  def change
    change_column :users do |t|
      t.string :preferred_day
      t.string :preferred_class
    end
  end
end
