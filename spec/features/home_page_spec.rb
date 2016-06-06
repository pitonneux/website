RSpec.feature 'visiting the home page' do
  scenario 'as a guest' do
    visit root_path

    expect(page).to have_link 'What we do',   href: '#what_we_do'
    expect(page).to have_link 'Schedule',     href: '#events'
    expect(page).to have_link 'Our partners', href: '#partners'
    expect(page).to have_link 'Contact us',   href: '#contact'
    expect(page).to have_link 'Connect',      href: '#connect'
  end
end
