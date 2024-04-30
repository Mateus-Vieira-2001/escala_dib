# frozen_string_literal: true

namespace :dev do
  desc 'Add TypeProfile to database'
  task add_type_profile: :environment do
    if TypeProfile.all == []
      TypeProfile.create(description: 'Professor')
      TypeProfile.create(description: 'Auxiliar')
      TypeProfile.create(description: 'Líder')
      TypeProfile.create(description: 'Professor e Auxiliar')
      TypeProfile.create(description: 'Líder e Auxiliar')
      TypeProfile.create(description: 'Assistente do Líder')
    end
  end

  desc 'Add PreferredDay to database'
  task add_preferred_day: :environment do
    if PreferredDay.all == []
      PreferredDay.create(description: 'Domingo de manhã')
      PreferredDay.create(description: 'Domingo de noite')
      PreferredDay.create(description: 'Domingo')
      PreferredDay.create(description: 'Segunda Feira')
      PreferredDay.create(description: 'Terça Feira')
      PreferredDay.create(description: 'Quarta Feira')
      PreferredDay.create(description: 'Quinta Feira')
    end
  end

  desc 'Add PreferredClass to database'
  task add_preferred_class: :environment do
    if PreferredClass.all == []
      PreferredClass.create(description: 'Kids1')
      PreferredClass.create(description: 'Kids2')
      PreferredClass.create(description: 'Kids')
      PreferredClass.create(description: 'Pre1')
      PreferredClass.create(description: 'Pre2')
      PreferredClass.create(description: 'Pre')
      PreferredClass.create(description: 'Babies')
      PreferredClass.create(description: 'Teens1')
      PreferredClass.create(description: 'Teens2')
      PreferredClass.create(description: 'Teens')
    end
  end

  desc 'Create Users in database'
  task create_users: :environment do
    2500.times do
      FactoryBot.create(:user)
    end
  end

  desc 'Create Lessons in database'
  task create_lessons: :environment do
    52.times do
      FactoryBot.create(:lesson)
    end
  end
end
