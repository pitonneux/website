feature 'listing all events' do
  scenario '#TODO: as an admin' do
    visit admin_dashboard_path
    click_link 'List all events'
    expect(page).to have_content event1.name
    expect(page).to have_content truncate(event1.description)
    expect(page).to have_content event1.start_date
    expect(page).to have_content event1.name
  end
end
