require 'rails_helper'

RSpec.feature 'showing events' do
  scenario 'guest does not see any links to edit or delete the event but admin does' do
    event = create :event

    visit event_path(event)
    expect(page).to have_content event.name
    expect(page).to have_no_link 'Edit'
    expect(page).to have_no_link 'Delete'

    admin = create :user, :admin
    login_as admin

    visit events_path
    expect(page).to have_content event.name
    expect(page).to have_link 'Edit'
    expect(page).to have_link 'Delete'
  end
end

