# frozen_string_literal: true

json.array! @preferred_days, partial: 'preferred_days/preferred_day', as: :preferred_day
