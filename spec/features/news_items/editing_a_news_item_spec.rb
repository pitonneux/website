# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'editing an existing news item' do
  scenario 'admin edits a news item' do
    news_item = create :news_item
    admin = create :user, :admin
    login_as admin

    visit news_item_path(news_item)
    click_link 'Edit'
    fill_form :news_item, title: 'A new title for the news item',
                          description: 'Nice description'
    click_button 'Update News Item'
    news_item.reload

    expect(page).to have_content t('news_items.update.success')
    expect(page).to have_content news_item.title
    expect(page).to have_content news_item.description
  end
end
