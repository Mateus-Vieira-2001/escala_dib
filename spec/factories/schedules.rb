# frozen_string_literal: true

FactoryBot.define do
  factory :schedule do
    user
    assistent_name { :user }
    teacher_name { :user }
    assistent_leader_name { :user }
    leader_name { :user }

    lesson
  end
end
