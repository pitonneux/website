require 'rails_helper'

RSpec.feature 'sending a new group message' do
  scenario 'seding a group email with a custom message' do
    admin = create :user, :admin
    login_as admin

    visit new_group_message_path

    fill_form :group_message, message: 'A message to the group'
    click_button 'Send Message'
    confirm dialog ('You are about to send a message to 20 recipients, go ahead?')

    expect(page).to have_content 'Your message has been sent'
  end
end
