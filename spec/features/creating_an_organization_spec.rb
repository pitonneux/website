feature 'creating an organization' do
  scenario 'directly from new organization path' do
    visit new_organization_path
    expect(page).to have_content 'New Organization'

    fill_form :organization, { name: 'We Work',
                               description: 'Coworking and community building',
                             }
    click_button 'Create organization'
    expect(page).to have_content 'We Work'
    expect(page).to have_content 'Coworking and community building'
  end
end
