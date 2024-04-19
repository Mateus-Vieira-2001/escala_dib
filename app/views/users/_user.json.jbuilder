# frozen_string_literal: true

json.extract! user, :id, :name, :birthdate, :email, :telefone, :profile, :created_at, :updated_at
json.url user_url(user, format: :json)
