# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :teacher
  belongs_to :assistent
  belongs_to :leader
  belongs_to :lesson
end
