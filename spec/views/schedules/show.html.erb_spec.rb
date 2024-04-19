# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'schedules/show' do
  before do
    @schedule = assign(:schedule, Schedule.create!(
                                    teacher_name: 'Teacher Name',
                                    teacher: nil,
                                    assistent_name: 'Assistent Name',
                                    assistent: nil,
                                    leader_name: 'Leader Name',
                                    leader: nil,
                                    lesson_title: 'Lesson Title',
                                    lesson: nil,
                                    stopover_day: 'Stopover Day'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Teacher Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Assistent Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Leader Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Lesson Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Stopover Day/)
  end
end
