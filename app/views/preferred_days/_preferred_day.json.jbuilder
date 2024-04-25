# frozen_string_literal: true

json.extract! preferred_day, :id, :description, :created_at, :updated_at
json.url preferred_day_url(preferred_day, format: :json)
