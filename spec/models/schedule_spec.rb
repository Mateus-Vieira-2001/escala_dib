# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Schedule do
  describe 'associações' do
    it { is_expected.to belong_to(:leader_name).class_name('Schedule') }
  end
end
