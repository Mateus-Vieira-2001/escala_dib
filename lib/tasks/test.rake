# frozen_string_literal: true

namespace :test do
  desc 'TODO'
  task create_users: :environment do
    2500.times do
      FactoryBot.create(:user)
    end
  end

  desc 'TODO'
  task create_lessons: :environment do
    52.times do
      FactoryBot.create(:lesson)
    end
  end
end
