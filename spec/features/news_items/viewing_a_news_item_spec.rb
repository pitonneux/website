# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'viewing news items' do
  scenario 'it is available for guests' do
    news_item = create :news_item

    visit news_item_path(news_item)
    expect(page).to have_content news_item.title
    expect(page).to have_content news_item.description
  end
end
