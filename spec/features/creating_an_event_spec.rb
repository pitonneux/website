RSpec.feature 'creating an event' do
  scenario 'from event index' do
    admin = create :user, :admin
    login_as admin

    visit events_path
    click_link 'Create a new event'
    expect(page).to have_content 'New Event'

    fill_form :event, { name: 'Learn iOS',
                        description: 'Come and learn how to make an app',
                        signup_link: 'signuphere.com',
                        duration_in_min: 90
                      }
    select_date '2016,June,3', from: 'Date'
    select_time '18', '00', from: 'Starts At'
    check 'Feature on homepage'
    click_button 'Create event'
    expect(page).to have_content 'Event was created successfully'
    expect(page).to have_content 'Learn iOS'
    expect(page).to have_content 'Come and learn how to make an app'
    expect(page).to have_content 'signuphere.com'
    expect(page).to have_content 'June 3, 2016'
    expect(page).to have_content '6:00 pm'
    expect(page).to have_content '90 minutes'
    expect(current_path).to eq event_path(Event.last)
  end

  scenario 'getting to events index' do
    admin = create :user, :admin
    sign_in admin.email, admin.password

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_current_path events_path
    expect(page).to have_link 'Create a new event'
  end
end
