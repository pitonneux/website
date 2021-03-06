# frozen_string_literal: true
class Event < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  belongs_to :location
  mount_uploader :cover_image, CoverImageUploader

  validate :image_size

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :starts_at

  scope :featured, -> { where featured: true }
  scope :upcoming, -> { where 'starts_at >= ?', Time.now }

  private

  def image_size
    return if cover_image.size < 5.megabytes
    errors.add(:cover_image, 'cannot be more than 5MB')
  end

  def slug_candidates
    [
      :name,
      [:name, start_date],
      [:name, start_date, location_name]
    ]
  end

  def start_date
    starts_at.try(:to_date)
  end

  def location_name
    location.try(:name)
  end
end
