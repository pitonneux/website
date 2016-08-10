# frozen_string_literal: true
require 'rails_helper'
require 'sidekiq/testing'

RSpec.feature 'sending a message', js: true do
  before do
    allow(SendGrid::API).to receive(:new).and_return true
    allow(SendGrid::Contact).to receive(:create).and_return true
  end

  scenario 'from the home page contact us form' do
    clear_jobs_queue
    visit root_path
    fill_form :message, 'Name': 'New User',
                        'Email': 'test@email.com',
                        "Tell us what you're learning!": 'Hi there!'

    click_button 'Send message'

    expect(page).to have_content t('messages.success.thanks')
    expect(Sidekiq::Worker.jobs.size).to eq 1
  end

  scenario 'someone submits an invalid form' do
    clear_jobs_queue
    visit root_path
    fill_form :message, 'Name': '',
                        'Email': '',
                        "Tell us what you're learning!": ''

    click_button 'Send message'

    expect(page).to have_content "Looks like that's not a valid email address. Could you double check it?"
    expect(page).to have_content "Sender can't be blank"
    expect(page).to have_content "Content can't be blank"

    expect(Sidekiq::Worker.jobs.size).to eq 0
  end
end
