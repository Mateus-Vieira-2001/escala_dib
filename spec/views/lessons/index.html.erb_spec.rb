# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lessons/index' do
  before do
    assign(:lessons, [
             Lesson.create!(
               title: 'Title',
               handout: 'Handout'
             ),
             Lesson.create!(
               title: 'Title',
               handout: 'Handout'
             )
           ])
  end

  it 'renders a list of lessons' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Handout'.to_s, count: 2
  end
end
