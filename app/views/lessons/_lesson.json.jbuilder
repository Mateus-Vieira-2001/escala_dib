# frozen_string_literal: true

json.extract! lesson, :id, :title, :handout, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
