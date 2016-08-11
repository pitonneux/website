# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all contact emails' do
  scenario 'as an admin' do
    admin = create :user, :admin
    login_as admin

    contacts = create_list :contact, 2
    visit contacts_path

    expect(page).to have_content contacts.first.email
    expect(page).to have_content l(contacts.first.created_at, format: :full)
    expect(page).to have_content contacts.second.email
    expect(page).to have_content l(contacts.second.created_at, format: :full)
  end
end
