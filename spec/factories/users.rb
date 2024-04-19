# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    birthdate { '2024-04-19' }
    email { 'MyString' }
    telefone { 'MyString' }
    profile { 1 }
  end
end
