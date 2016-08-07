# frozen_string_literal: true
module EventsHelper
  def date_for(event)
    if event.starts_at.present?
      l(event.starts_at, format: :date)
    else
      t('events.no_start_date')
    end
  end

  def time_for(event)
    if event.duration_in_min.present?
      start_time = l(event.starts_at, format: :time)
      end_time = l(event.starts_at + event.duration_in_min * 60, format: :time)
      "#{start_time} - #{end_time}"
    else
      l(event.starts_at, format: :time)
    end
  end
end
