# frozen_string_literal: true

class CallingTaskFillDatabaseTypeProfile < ActiveRecord::Migration[7.1]
  def change
    return unless TypeProfile.count.zero?

    Rake::Task['dev:add_type_profile'].invoke
  end
end
