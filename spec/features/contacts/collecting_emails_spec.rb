# frozen_string_literal: true
require 'rails_helper'
require 'sidekiq/testing'

RSpec.feature 'collecting email addresses from the home page', js: true do
  scenario 'someone submits a valid email' do
    clear_jobs_queue
    visit root_path

    fill_form :contact, 'Your email address': 'valid@email.com'
    click_button 'Keep me posted'

    expect(page).to have_content 'Thanks for signing up!'
    expect(Sidekiq::Worker.jobs.size).to eq 1
  end

  scenario 'someone submits an invalid or duplicate email' do
    create :contact, email: 'an_email_we_already_have@gmail.com'
    clear_jobs_queue

    visit root_path
    fill_form :contact, 'Your email address': 'invalid@email'
    click_button 'Keep me posted'

    expect(page).to have_content "Looks like that's not a valid email address. Could you double check it?"
    expect(Sidekiq::Worker.jobs.size).to eq 0

    fill_form :contact, 'Your email address': 'an_email_we_already_have@gmail.com'
    click_button 'Keep me posted'

    expect(page).to have_content "Looks like you're already signed up! We have that email already."
    expect(Sidekiq::Worker.jobs.size).to eq 0
  end
end
