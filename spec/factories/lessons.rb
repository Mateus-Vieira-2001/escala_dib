# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    title { Faker::Book.title }
    handout { 'MyString' }
  end
end
