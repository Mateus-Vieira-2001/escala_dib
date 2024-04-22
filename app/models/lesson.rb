# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :schedule, class: Schedule
end
