# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { "#{Faker::Lorem.word}@gmail.com" }
    telefone { Faker::PhoneNumber.phone_number_with_country_code }
    profile do
      ['Professor', 'Auxiliar', 'Líder', 'Líder e Auxiliar', 'Líder e Professor', 'Assistente do Líder'].sample
    end

    preferred_day do
      ['Domingo de manhã', 'Domingo de noite', 'Domingo', 'Segunda Feira', 'Terça Feira', 'Quarta Feira',
       'Quinta Feira'].sample
    end
  end
end
