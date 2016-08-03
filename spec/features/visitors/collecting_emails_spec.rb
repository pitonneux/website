# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'collecting email addresses from the home page' do
  scenario 'someone submits a valid email' do
    visit root_path
    fill_form :visitor, 'Your email address': 'valid@email.com'
    click_button 'Keep me posted'

    expect(page).to have_content "Thanks for signing up!"
  end
end
