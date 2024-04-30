# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'lessons/show' do
  before do
    @lesson = assign(:lesson, Lesson.create!(
                                title: 'Title',
                                handout: 'Handout'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Handout/)
  end
end
