# frozen_string_literal: true

# This migration creates the schedules table, which represents schedules for lessons.
# Each schedule includes information about the teacher, assistant, leader, lesson title,
# and stopover day.
class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.string :teacher
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.string :assistent
      t.references :assistent, null: false, foreign_key: { to_table: :users }
      t.string :leader
      t.references :leader, null: false, foreign_key: { to_table: :users }
      t.string :lesson
      t.references :lesson, null: false, foreign_key: { to_table: :lessons }
      t.string :stopover_day

      t.timestamps
    end
  end
end
