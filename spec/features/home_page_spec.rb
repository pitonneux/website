# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'visiting the home page' do
  scenario 'as a guest' do
    visit root_path

    expect(page).to have_link 'What we do',   href: '#what_we_do'
    expect(page).to have_link 'Events',       href: '#events'
    expect(page).to have_link 'Contact us',   href: '#contact'
    expect(page).to have_link 'Connect',      href: '#connect'

    expect(page).to have_link 'Workshops',     href: '/events#workshops'
    expect(page).to have_link 'Coffee & Code', href: '/events'
  end
end
