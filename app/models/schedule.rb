# frozen_string_literal: true

class Schedule < ApplicationRecord
  # belongs_to :user
  belongs_to :assistent_name, class_name: 'User', foreign_key: 'assistent_id'
  belongs_to :teacher_name, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :leader_name, class_name: 'User', foreign_key: 'leader_id'
  belongs_to :lesson_title, class_name: 'Lesson', foreign_key: 'lesson_id'

  def destroy
    delete
  end
end
