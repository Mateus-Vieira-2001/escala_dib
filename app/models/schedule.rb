# frozen_string_literal: true

class Schedule < ApplicationRecord
  # belongs_to :user
  belongs_to :assistent_name, class_name: 'User', foreign_key: 'assistent_id'
  belongs_to :teacher_name, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :leader_name, class_name: 'User', foreign_key: 'leader_id'
  # belongs_to :lesson_tit
end

# class Schedule < ApplicationRecord
#   belongs_to :assistent_name, class_name: 'User', foreign_key: 'assistent_id', inverse_of: :assistent_schedules
#   belongs_to :teacher_name, class_name: 'User', foreign_key: 'teacher_id', inverse_of: :teacher_schedules
#   belongs_to :leader_name, class_name: 'User', foreign_key: 'leader_id', inverse_of: :leader_schedules
#   belongs_to :lesson
# end
