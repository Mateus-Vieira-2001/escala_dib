# frozen_string_literal: true

namespace :sc do
  desc 'Create schedule'
  task create_schedule: :environment do
    create_schedule_for_month
  end

  desc 'Delete schedule'
  task delete_schedule: :environment do
    delete_schedule_last_month
  end

  def delete_schedule_last_month
    last_month = Time.zone.today.next_month
    total_days_in_last_month = Time.days_in_month(last_month.month)

    (1..total_days_in_last_month).each do |day|
      date = Date.new(last_month.year, last_month.month, day).strftime('%Y-%m-%d')
      delete_day(date)
    end
  end

  def delete_day(date)
    schedule = Schedule.where(stopover_day: date)
    if schedule.empty?
      puts "Nenhum agendamento encontrado para #{date}."
    else
      byebug
      schedule.destroy_all
      puts "Agendamento para #{date} excluído com sucesso."
    end
  end

  def create_schedule_for_month
    next_month = Time.zone.today.next_month.next_month
    total_days_in_next_month = Time.days_in_month(next_month.month)

    (1..total_days_in_next_month).each do |day|
      date = Date.new(next_month.year, next_month.month, day)
      create_schedule_for_day(date)
    end
  end

  def create_schedule_for_day(date)
    if date.sunday?
      create_sunday_schedule(date)
    elsif date.on_weekday? && !date.friday?
      create_week_schedule(date)
    end
  end

  def create_sunday_schedule(date)
    morning_users = User.where(preferred_day: ['Domingo', 'Domingo de manhã'])
    evening_users = User.where(preferred_day: ['Domingo', 'Domingo de noite'])

    if date.sunday?
      create_schedule_for_time_slot_sunday(date, morning_users, 'Primeiro horário manha')
      create_schedule_for_time_slot_sunday(date, morning_users, 'Segundo horário manha')
    end
    create_schedule_for_time_slot_sunday(date, evening_users)
  end

  def create_week_schedule(date)
    user = if date.monday?
             User.where(preferred_day: 'Segunda feira')
           elsif date.tuesday?
             User.where(preferred_day: 'Terça Feira')
           elsif date.wednesday?
             User.where(preferred_day: 'Quarta Feira')
           elsif date.thursday?
             User.where(preferred_day: 'Quinta Feira')
           end

    create_schedule_for_time_slot_week(date, user) if user.present?
  end

  def create_schedule_for_time_slot_sunday(date, users, observation = nil)
    create_schedule_for_time_slot(date, users, observation)
  end

  def create_schedule_for_time_slot_week(date, users, observation = nil)
    create_schedule_for_time_slot(date, users, observation)
  end

  def create_schedule_for_time_slot(date, users, observation)
    babies = users.where(preferred_class: 'Babies')
    kids1 = users.where(preferred_class: %w[Kids1 Kids])
    kids2 = users.where(preferred_class: %w[Kids2 Kids])
    pre1 = users.where(preferred_class: %w[Pre Pre1])
    pre2 = users.where(preferred_class: %w[Pre Pre2])

    leader = users.where(profile: 'Líder').order('RAND()').first
    assistent_leader = users.where(profile: 'Assistente do Líder').order('RAND()').first
    create_schedule_for_category(babies, leader, assistent_leader, date, observation)
    create_schedule_for_category(kids1, leader, assistent_leader, date, observation)
    create_schedule_for_category(kids2, leader, assistent_leader, date, observation)
    create_schedule_for_category(pre1, leader, assistent_leader, date, observation)
    create_schedule_for_category(pre2, leader, assistent_leader, date, observation)
  end

  def create_schedule_for_category(users, leader, assistent_leader, date, observation = nil)
    teacher = nil
    assistent = nil
    max_attempts = 10
    attempts = 0

    until teacher.present? || attempts >= max_attempts
      teacher = users.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
      attempts += 1
    end

    attempts = 0

    until assistent.present? || attempts >= max_attempts
      assistent = users.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
      attempts += 1
    end

    if teacher.present? && assistent.present?
      Schedule.create(
        teacher: teacher.name,
        teacher_id: teacher.id,
        assistent: assistent.name,
        assistent_id: assistent.id,
        leader: leader.name,
        leader_id: leader.id,
        assistent_leader_name: assistent_leader.name,
        assistent_leader_id: assistent_leader.id,
        lesson: Lesson.last.title,
        lesson_id: Lesson.last.id,
        stopover_day: date,
        observation:
      )
    else
      puts "Não foi possível encontrar professores e assistentes adequados após #{max_attempts} tentativas."
    end
  end
end
