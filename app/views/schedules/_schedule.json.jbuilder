# frozen_string_literal: true

json.extract! schedule, :id, :teacher_name, :teacher_id, :assistent_name, :assistent_id, :leader_name, :leader_id,
              :lesson_title, :lesson_id, :stopover_day, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
