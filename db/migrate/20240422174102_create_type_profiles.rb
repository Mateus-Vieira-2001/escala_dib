# frozen_string_literal: true

class CreateTypeProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :type_profiles do |t|
      t.string :description

      t.timestamps
    end
  end
end
