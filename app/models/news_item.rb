# frozen_string_literal: true
class NewsItem < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates_presence_of :title
  validates_presence_of :description

  private

  def slug_candidates
    [
      :title,
      [:title, created_date],
      [:title, created_date_and_time]
    ]
  end

  def created_date
    created_at.try(:to_date)
  end

  def created_date_and_time
    created_at.try(:time)
  end
end
