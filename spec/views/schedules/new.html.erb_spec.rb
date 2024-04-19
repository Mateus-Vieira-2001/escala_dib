# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'schedules/new' do
  before do
    assign(:schedule, Schedule.new(
                        teacher_name: 'MyString',
                        teacher: nil,
                        assistent_name: 'MyString',
                        assistent: nil,
                        leader_name: 'MyString',
                        leader: nil,
                        lesson_title: 'MyString',
                        lesson: nil,
                        stopover_day: 'MyString'
                      ))
  end

  it 'renders new schedule form' do
    render

    assert_select 'form[action=?][method=?]', schedules_path, 'post' do
      assert_select 'input[name=?]', 'schedule[teacher_name]'

      assert_select 'input[name=?]', 'schedule[teacher_id]'

      assert_select 'input[name=?]', 'schedule[assistent_name]'

      assert_select 'input[name=?]', 'schedule[assistent_id]'

      assert_select 'input[name=?]', 'schedule[leader_name]'

      assert_select 'input[name=?]', 'schedule[leader_id]'

      assert_select 'input[name=?]', 'schedule[lesson_title]'

      assert_select 'input[name=?]', 'schedule[lesson_id]'

      assert_select 'input[name=?]', 'schedule[stopover_day]'
    end
  end
end
