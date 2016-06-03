feature 'creating an organization' do
  scenario 'from the home page' do
    visit root_path
    click_link 'Create a new organization'
  end
end
