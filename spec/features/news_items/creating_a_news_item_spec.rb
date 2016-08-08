# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'creating a news item' do
  scenario 'directly from new news item path' do
    admin = create :user, :admin
    login_as admin

    visit news_items_path
    click_link 'Add a News Item'

    fill_form :news_item, title: 'Some News',
                          description: 'Lots of news to read here!'
    click_button 'Create News Item'
    expect(page).to have_content 'Some News'
    expect(page).to have_content 'Lots of news to read here!'
  end

  scenario 'attempting to create an invalid news item' do
    admin = create :user, :admin
    login_as admin

    visit news_items_path
    click_link 'Add a News Item'

    click_button 'Create News Item'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end

