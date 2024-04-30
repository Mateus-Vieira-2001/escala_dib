# frozen_string_literal: true

namespace :sc do
  desc 'Create schedule'
  task create_schedule: :environment do
    # Schedule.delete_all
    create_schedule_for_month
  end

  def create_schedule_for_month
    current_day = Time.current.day
    next_month = Time.zone.today.next_month
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
    first_sunday  = date if date.sunday? && first_sunday.nil?
    morning_users = User.where(preferred_day: ['Domingo', 'Domingo de manhã'])
    evening_users = User.where(preferred_day: ['Domingo', 'Domingo de noite'])

    if date == first_sunday
      create_schedule_for_time_slot_sunday(date, morning_users, 'Primeiro horário')
      create_schedule_for_time_slot_sunday(date, morning_users, 'Segundo horário')
    else
      create_schedule_for_time_slot_sunday(date, morning_users)
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
    create_schedule_for_time_slot_week(date, user)
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
    teacher = users.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
    assistent = users.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
    loop do
      break if Schedule.where(teacher: teacher.name).count <= 2 && Schedule.where(teacher: teacher.name,
                                                                                  stopover_day: date).count < 2

      teacher = users.where(profile: ['Professor', 'Professor e Auxiliar']).order('RAND()').first
    end

    loop do
      break if Schedule.where(assistent: assistent.name).count <= 2 && Schedule.where(assistent: assistent.name,
                                                                                      stopover_day: date).count < 2

      assistent = users.where(profile: ['Auxiliar', 'Professor e Auxiliar']).order('RAND()').first
    end

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
  end
end
