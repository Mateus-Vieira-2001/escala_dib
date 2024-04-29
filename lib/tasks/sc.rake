# frozen_string_literal: true

namespace :sc do
  desc 'Create schedule'
  task create_schedule: :environment do
    current_day = Time.current.day
    next_month = Time.zone.today.next_month
    total_days_in_next_month = Time.days_in_month(next_month.month)
    days_in_next_month = Date.new(next_month.year, next_month.month, 1)

    (1..total_days_in_next_month).each do |day|
      date = Date.new(next_month.year, next_month.month, day)
      next unless date.sunday?

      # Horarios de domingo
      morning_users = User.where(preferred_day: ['Domingo', 'Domingo de manhã'])
      evening_users = User.where(preferred_day: ['Domingo', 'Domingo de noite'])
      # Salas manha
      babies_morning = morning_users.where(preferred_class: 'Babies')
      kids1_morning = morning_users.where(preferred_class: %w[Kids1 Kids])
      kids2_morning = morning_users.where(preferred_class: %w[Kids2 Kids])
      pre1_morning = morning_users.where(preferred_class: %w[Pre Pre1])
      pre2_morning = morning_users.where(preferred_class: %w[Pre Pre2])

      leader_morning = morning_users.where(profile: 'Líder').order('RAND()').first
      assistent_leader_morning = morning_users.where(profile: 'Assistente do Líder').order('RAND()').first

      # Horario da manhã

      # Babies
      teacher_babies = babies_morning.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      assistent_babies = babies_morning.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
      Schedule.create(
        teacher_name: teacher_babies.name,
        teacher_id: teacher_babies.id,
        assistent_name: assistent_babies.name,
        assistent_id: assistent_babies.id,
        leader_name: leader_morning.name,
        leader_id: leader_morning.id,
        assistent_leader_name: assistent_leader_morning.name,
        assistent_leader_id: assistent_leader_morning.id,
        lesson_title: Lesson.last.title,
        lesson_id: Lesson.last.id,
        stopover_day: date
      )

      teacher_kids1 = kids1_morning.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      assistent_kids1 = kids1_morning.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
      Schedule.create(teacher_name: teacher_kids1.name, teacher_id: teacher_kids1.id,
                      assistent_name: assistent_kids1.name, assistent_id: assistent_kids1.id,
                      leader_name: leader_morning.name, leader_id: leader_morning.id,
                      assistent_leader: assistent_leader_morning.name, lesson_title: Lesson.last.title,
                      lesson_id: Lesson.last.id, stopover_day: date)

      teacher_kids2 = kids2_morning.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      assistent_kids2 = kids2_morning.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first

      Schedule.create(teacher_name: teacher_kids2.name, teacher_id: teacher_kids2.id,
                      assistent_name: assistent_kids2.name, assistent_id: assistent_kids2.id, leader_name: leader_morning.name, leader_id: leader_morning.id, assistent_leader: assistent_leader_morning.name, lesson_title: Lesson.last.title, lesson_id: Lesson.last.id, stopover_day: date)

      teacher_pre1 = pre1_morning.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      assistent_pre1 = pre1_morning.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first

      Schedule.create(teacher_name: teacher_pre1.name, teacher_id: teacher_pre1.id,
                      assistent_name: assistent_pre1.name, assistent_id: assistent_pre1.id,
                      leader_name: leader_morning.name, leader_id: leader_morning.id,
                      assistent_leader: assistent_leader_morning.name, lesson_title: Lesson.last.title,
                      lesson_id: Lesson.last.id, stopover_day: date)

      teacher_pre2 = pre2_morning.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      assistent_pre2 = pre2_morning.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
      byebug
      Schedule.create(teacher_name: teacher_pre2.name, teacher_id: teacher_pre2.id,
                      assistent_name: assistent_pre2.name, assistent_id: assistent_pre2.id,
                      leader_name: leader_morning.name, leader_id: leader_morning.id,
                      assistent_leader: assistent_leader_morning.name, lesson_title: Lesson.last.title,
                      lesson_id: Lesson.last.id, stopover_day: date)
    end
  end
end
