# frozen_string_literal: true

class CallingTaskToFillDatabasePreferredClass < ActiveRecord::Migration[7.1]
  def change
    return unless PreferredClass.count.zero?

    Rake::Task['dev:add_preferred_class'].invoke
  end
end
