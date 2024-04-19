# frozen_string_literal: true

FactoryBot.define do
  factory :schedule do
    teacher_name { 'MyString' }
    teacher { nil }
    assistent_name { 'MyString' }
    assistent { nil }
    leader_name { 'MyString' }
    leader { nil }
    lesson_title { 'MyString' }
    lesson { nil }
    stopover_day { 'MyString' }
  end
end
