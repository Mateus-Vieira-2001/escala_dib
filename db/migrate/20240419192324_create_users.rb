# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.string :email
      t.string :telefone
      t.integer :profile

      t.timestamps
    end
  end
end
