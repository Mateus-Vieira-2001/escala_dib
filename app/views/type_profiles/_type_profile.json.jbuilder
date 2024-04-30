# frozen_string_literal: true

json.extract! type_profile, :id, :description, :created_at, :updated_at
json.url type_profile_url(type_profile, format: :json)
