# frozen_string_literal: true

json.extract! preferred_class, :id, :description, :created_at, :updated_at
json.url preferred_class_url(preferred_class, format: :json)
