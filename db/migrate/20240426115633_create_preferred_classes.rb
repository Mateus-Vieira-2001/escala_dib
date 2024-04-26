# frozen_string_literal: true

class CreatePreferredClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :preferred_classes do |t|
      t.string :description

      t.timestamps
    end
  end
end
