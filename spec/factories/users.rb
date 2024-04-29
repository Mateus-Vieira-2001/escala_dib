# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { "#{Faker::Lorem.word}@gmail.com" }
    telefone { Faker::PhoneNumber.phone_number_with_country_code }
    profile do
      ['Professor', 'Auxiliar', 'Líder', 'Assistente do Líder', 'Professor e Auxiliar'].sample
    end

    preferred_day do
      ['Domingo de manhã', 'Domingo de noite', 'Domingo', 'Segunda Feira', 'Terça Feira', 'Quarta Feira',
       'Quinta Feira'].sample
    end

    preferred_class do
      %w[Kids1 Kids2 Kids Pre1 Pre2 Pre Babies Teens1 Teens2 Teens2 Teens].sample
    end
  end
end
