# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all events' do
  scenario 'guest does not see past events but admin does' do
    finished_event = create :event, starts_at: 2.months.ago
    future_event   = create :event

    visit events_path
    expect(page).to have_content future_event.name
    expect(page).to have_no_content finished_event.name
    expect(page).to have_no_content t('events.index.new')

    admin = create :user, :admin
    login_as admin

    visit events_path
    expect(page).to have_content future_event.name
    expect(page).to have_content finished_event.name
    expect(page).to have_content t('events.index.new')
  end
end
