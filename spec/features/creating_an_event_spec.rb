require 'rails_helper'

feature 'creating an event' do
  scenario 'from the homepage' do
    visit root_path
    click_link 'Create a New Event'
    expect(page).to have_content 'New Event'

    fill_form :event, { name: 'Learn iOS',
                        : 1.week.from_now,
                        description: 'Come and learn how to make an app',
                        signup_link: 'signuphere.com',
                        duration_in_min: 90
                      }
    # select_time '18', '00', from: 'Starts at'
    check 'Feature on homepage'
    click_button 'Create event'
    expect(page).to have_content 'Learn iOS'
    expect(page).to have_content 'Come and learn how to make an app'
    expect(page).to have_content 'signuphere.com'
    expect(page).to have_content 'June 3, 2016'
    expect(page).to have_content '18:00'
    expect(page).to have_content '2 hours, 30 minutes'
    expect(page).to have_content 'Featured on homepage: Yes'
  end
end
