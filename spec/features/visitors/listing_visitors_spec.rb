# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all visitor emails', :vcr do
  scenario 'as an admin' do
    admin = create :user, :admin
    login_as admin

    visitors = create_list :visitor, 2
    visit visitors_path

    expect(page).to have_content visitors.first.email
    expect(page).to have_content l(visitors.first.created_at, format: :full)
    expect(page).to have_content visitors.second.email
    expect(page).to have_content l(visitors.second.created_at, format: :full)
  end
end
