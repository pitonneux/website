RSpec.feature 'sending a message', js: true do
  scenario 'from the home page contact us form' do
    visit root_path
    fill_form :message, { 'Name': 'New User',
                          'Email': 'test@email.com',
                          "Tell us what you're learning!": 'Hi there!' }

    click_button 'Send message'

    expect(page).to have_content t('messages.created.thanks')
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end

  scenario 'someone submits an invalid form' do
    visit root_path
    fill_form :message, { 'Name': '',
                          'Email': '',
                          "Tell us what you're learning!": '' }

    click_button 'Send message'

    expect(page).to have_content 'Email is invalid'
    expect(page).to have_content "Sender can't be blank"
    expect(page).to have_content "Content can't be blank"
  end
end
