# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lessons/edit' do
  before do
    @lesson = assign(:lesson, Lesson.create!(
                                title: 'MyString',
                                handout: 'MyString'
                              ))
  end

  it 'renders the edit lesson form' do
    render

    assert_select 'form[action=?][method=?]', lesson_path(@lesson), 'post' do
      assert_select 'input[name=?]', 'lesson[title]'

      assert_select 'input[name=?]', 'lesson[handout]'
    end
  end
end
