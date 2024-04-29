# frozen_string_literal: true

# Users can sign up, log in, and perform various actions within the application.
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :teacher_name, class_name: 'Schedule', foreign_key: 'teacher_id', dependent: :destroy
  has_many :assistent_name, class_name: 'Schedule', foreign_key: 'assistent_id', dependent: :destroy
  has_many :leader_name, class_name: 'Schedule', foreign_key: 'leader_id', dependent: :destroy
  has_many :user_profiles, dependent: :destroy

  has_many :type_profile, through: :type_profile
  has_many :preferred_days, through: :user_preferred_days
  has_many :preferred_classes, through: :user_preferred_classes

  validates :name, uniqueness: { message: 'O nome já esta cadastrado' }
  validate :check_profile
  validate :check_preferrence_day
  validate :check_preferrence_class

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

  def check_preferrence_day
    return if PreferredDay.find_by(description: preferred_day)

    errors.add(:profile, 'O dia não é válido')
    false
  end

  def check_preferrence_class
    return if PreferredClass.find_by(description: preferred_class)

    errors.add(:profile, 'A turma escolhida não é válida')
    false
  end

  def destroy
    delete
  end
end
