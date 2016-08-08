require 'rails_helper'

# frozen_string_literal: true
RSpec.describe EventsHelper, type: :helper do
  describe '#date_for' do
    it 'returns the date helper when event has a start date' do
      event = build_stubbed :event, starts_at: 'Mon, 06 Jun 2016 15:30:00 UTC +00:00'
      expect(helper.date_for(event)).to eq l(event.starts_at, format: :date)
    end

    it 'returns a friendly message when event has no start date' do
      event = build_stubbed :event, starts_at: nil
      expect(helper.date_for(event)).to eq t('events.no_start_date')
    end
  end

  describe '#time_for' do
    it 'returns the time range when event as a start date and duration' do
      event = build_stubbed :event, starts_at: 'Mon, 06 Jun 2016 15:30:00 UTC +00:00', duration_in_min: 60
      expect(helper.time_for(event)).to eq '3:30 pm - 4:30 pm'
    end

    it 'returns just the formatted start date when there is no duration' do
      event = build_stubbed :event, starts_at: 'Mon, 06 Jun 2016 15:30:00 UTC +00:00', duration_in_min: nil
      expect(helper.time_for(event)).to eq '3:30 pm'
    end
  end
end
