# frozen_string_literal: true

class CreatePreferredDays < ActiveRecord::Migration[7.1]
  def change
    create_table :preferred_days do |t|
      t.string :description

      t.timestamps
    end
  end
end
