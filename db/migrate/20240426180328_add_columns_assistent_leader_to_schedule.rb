# frozen_string_literal: true

class AddColumnsAssistentLeaderToSchedule < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :assistent_leader_name, :string
  end
end
