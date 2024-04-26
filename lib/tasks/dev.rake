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

  # desc 'Add PreferredClass to database'
  # task add_preferred_class: :environment do
  #   if PreferredDay.all == []
  #     PreferredDay.create(description: 'Kids1')
  #     PreferredDay.create(description: 'Kids2')
  #     PreferredDay.create(description: 'Kids')
  #     PreferredDay.create(description: 'Pre1')
  #     PreferredDay.create(description: 'Pre2')
  #     PreferredDay.create(description: 'Pre')
  #     PreferredDay.create(description: 'Babies')
  #     PreferredDay.create(description: 'Teens1')
  #     PreferredDay.create(description: 'Teens2')
  #     PreferredDay.create(description: 'Teens')
  #   end
  # end
end
