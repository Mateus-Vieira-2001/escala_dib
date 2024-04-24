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
end
