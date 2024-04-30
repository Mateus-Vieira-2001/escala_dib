# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'lessons/new' do
  before do
    assign(:lesson, Lesson.new(
                      title: 'MyString',
                      handout: 'MyString'
                    ))
  end

  it 'renders new lesson form' do
    render

    assert_select 'form[action=?][method=?]', lessons_path, 'post' do
      assert_select 'input[name=?]', 'lesson[title]'

      assert_select 'input[name=?]', 'lesson[handout]'
    end
  end
end
