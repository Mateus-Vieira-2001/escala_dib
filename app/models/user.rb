# frozen_string_literal: true

# Users can sign up, log in, and perform various actions within the application.
class User < ApplicationRecord
  has_many :user_teacher, class_name: 'schedule', foreign_key: 'teacher_id', dependent: :destroy, inverse_of: :schedule
  has_many :user_assistent, class_name: 'schedule', foreign_key: 'assistent_id', dependent: :destroy,
                            inverse_of: :schedule
  has_many :user_leader, class_name: 'schedule', foreign_key: 'leader_id', dependent: :destroy, inverse_of: :schedule

  enum profile: {
    leader: 1,
    teacher: 2,
    assistent: 3,
    teacher_assistent: 4,
    leader_assistent: 5,
    leader_teacher: 6
  }

  enum preferred_class: {

    Teens: 1,
    Teens1: 2,
    Teens2: 3,
    Pre: 4,
    Pre1: 5,
    Pre2: 6,
    Kids: 7,
    Kids1: 8,
    Kids2: 9,
    Babies: 10
  }
end
