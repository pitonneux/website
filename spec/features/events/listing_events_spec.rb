# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all events' do
  scenario 'guest does not see past events but admin does' do
    past_event = create :event, created_at: 2.months.ago
    event = create :event
    visit events_path
    expect(page).to have_content event.name
  end
end
