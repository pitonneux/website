# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  it { is_expected.to validate_presence_of :title       }
  it { is_expected.to validate_presence_of :description }

  describe 'slugging' do
    it 'handles slugging events when slugs are taken' do
      news_item = create :news_item, title: 'A news item'
      expect(news_item.slug).to eq 'a-news-item'

      next_item = create :news_item, title: 'A news item', created_at: Time.zone.parse('2016-01-25 18:00:00')
      expect(next_item.slug).to eq 'a-news-item-2016-01-25'

      another_item = create :news_item, title: 'A news item', created_at: Time.zone.parse('2016-01-25 18:00:00')
      expect(another_item.slug).to eq 'a-news-item-2016-01-25-18-00-00-utc'
    end

    context 'object is invalid' do
      it 'does not set a slug' do
        news_item = build :news_item, title: nil
        expect(news_item).to be_invalid
        expect(news_item.slug).to be_nil
      end
    end
  end
end
