# frozen_string_literal: true

class AddColumnsObservationsToTableSchedule < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :observation, :string
  end
end
