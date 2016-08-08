# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all news items' do
  scenario 'as an admin' do
    admin = create :user, :admin
    login_as admin

    news_items = create_list :news_item, 2
    visit news_items_path

    expect(page).to have_content news_items.first.title
    expect(page).to have_content l(news_items.first.created_at, format: :full)
    expect(page).to have_content news_items.second.title
    expect(page).to have_content news_items.second.description
  end
end

