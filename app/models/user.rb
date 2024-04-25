# frozen_string_literal: true

# Users can sign up, log in, and perform various actions within the application.
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :user_teacher, class_name: 'schedule', foreign_key: 'teacher_id', dependent: :destroy, inverse_of: :schedule
  has_many :user_assistent, class_name: 'schedule', foreign_key: 'assistent_id', dependent: :destroy,
                            inverse_of: :schedule
  has_many :user_leader, class_name: 'schedule', foreign_key: 'leader_id', dependent: :destroy, inverse_of: :schedule
  has_many :user_profiles, dependent: :destroy
  has_many :type_profile, through: :type_profile

  validate :check_name
  validate :check_profile

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
  def check_name
    # return if User.exists? == false

    return if User.exists?(name:) == false

    errors.add(:name, 'O nome ja está cadastrado')
    false
  end

  def check_profile
    return if TypeProfile.find_by(description: profile)

    errors.add(:profile, 'O tipo de usuario nao é permitido')
    false
  end

  def destroy
    delete
  end
end
