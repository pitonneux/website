# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all messages' do
  scenario 'as an admin' do
    admin = create :user, :admin
    login_as admin

    messages = create_list :message, 2
    visit messages_path

    expect(page).to have_content messages.first.sender
    expect(page).to have_content l(messages.first.created_at, format: :full)
    expect(page).to have_content messages.second.email
    expect(page).to have_content messages.second.content
  end
end
