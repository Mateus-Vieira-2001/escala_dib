# frozen_string_literal: true

class AddColumnAssistentLeaderName < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :assistent_leader, null: false, foreign_key: { to_table: :users }
  end
end
