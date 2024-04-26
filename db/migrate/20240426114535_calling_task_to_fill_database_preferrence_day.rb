# frozen_string_literal: true

class CallingTaskToFillDatabasePreferrenceDay < ActiveRecord::Migration[7.1]
  def change
    return unless PreferredDay.count.zero?

    Rake::Task['dev:add_preferred_day'].invoke
  end
end
