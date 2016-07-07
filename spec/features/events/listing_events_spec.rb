# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all events' do
  scenario 'guest visits' do
    event = create :event
    visit events_path
    expect(page).to have_content event.name
  end
end
