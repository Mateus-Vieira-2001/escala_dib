# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'schedules/index' do
  before do
    assign(:schedules, [
             Schedule.create!(
               teacher_name: 'Teacher Name',
               teacher: nil,
               assistent_name: 'Assistent Name',
               assistent: nil,
               leader_name: 'Leader Name',
               leader: nil,
               lesson_title: 'Lesson Title',
               lesson: nil,
               stopover_day: 'Stopover Day'
             ),
             Schedule.create!(
               teacher_name: 'Teacher Name',
               teacher: nil,
               assistent_name: 'Assistent Name',
               assistent: nil,
               leader_name: 'Leader Name',
               leader: nil,
               lesson_title: 'Lesson Title',
               lesson: nil,
               stopover_day: 'Stopover Day'
             )
           ])
  end

  it 'renders a list of schedules' do
    render
    assert_select 'tr>td', text: 'Teacher Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Assistent Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Leader Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Lesson Title'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Stopover Day'.to_s, count: 2
  end
end
