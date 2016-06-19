require 'rails_helper'

# frozen_string_literal: true
RSpec.feature 'creating an organization' do
  scenario 'directly from new organization path' do
    admin = create :user, :admin
    login_as admin

    visit organizations_path
    find('summary', text: 'Add a new organization').click

    fill_form :organization, name: 'We Work',
                             description: 'Coworking and community building'
    click_button 'Create organization'
    expect(page).to have_content 'Coworking and community building'
  end
end
