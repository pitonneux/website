RSpec.describe EventsHelper, type: :helper do
  describe 'time date_and_time_for' do
    it 'returns the date helper when event has a start date' do
      event = build_stubbed :event, starts_at: 'Mon, 06 Jun 2016 15:30:00 UTC +00:00'
      expect(helper.date_and_time_for(event)).to eq l(event.starts_at, format: :full)
    end

    it 'returns a friendly message when event has no start date' do
      event = build_stubbed :event, starts_at: nil
      expect(helper.date_and_time_for(event)).to eq t('events.no_start_date')
    end
  end
end
