# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'creating an event' do
  scenario 'from event index' do
    admin = create :user, :admin
    login_as admin

    visit events_path
    click_link t('events.index.new')

    fill_form :event, name: 'Learn iOS',
                      tagline: 'Come and learn how to make an app',
                      description: 'A nice little description for the event',
                      signup_link: 'signuphere.com',
                      duration_in_min: 90,
                      price: 100
    select_date '2016,June,3', from: 'Date'
    select_time '18', '00', from: 'Start time'
    check 'Feature on homepage'
    click_button 'Create Event'
    expect(page).to have_content 'Event was created successfully'
    expect(page).to have_content 'Learn iOS'
    expect(page).to have_content 'Come and learn how to make an app'
    expect(page).to have_content 'June 3, 2016'
    expect(page).to have_content '6:00 pm'
    expect(page).to have_no_content 'A nice little description for the event'
    expect(current_path).to eq events_path
  end

  scenario 'getting to events index' do
    admin = create :user, :admin
    sign_in admin.email, admin.password

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_current_path events_path
    expect(page).to have_content t('events.index.new')
  end
end
