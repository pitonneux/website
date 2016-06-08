module EventsHelper
  def date_and_time_for(event)
    if event.starts_at.present?
      l(event.starts_at, format: :full)
    else
      t('events.no_start_date')
    end
  end
end
