# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.string :teacher_name
      t.references :teacher, null: false, foreign_key: true
      t.string :assistent_name
      t.references :assistent, null: false, foreign_key: true
      t.string :leader_name
      t.references :leader, null: false, foreign_key: true
      t.string :lesson_title
      t.references :lesson, null: false, foreign_key: true
      t.string :stopover_day

      t.timestamps
    end
  end
end
