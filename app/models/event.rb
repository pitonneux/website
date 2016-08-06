# frozen_string_literal: true
class Event < ApplicationRecord
  belongs_to :location
  mount_uploader :cover_image, CoverImageUploader

  validate :image_size

  validates_presence_of :name
  validates_presence_of :description

  scope :featured, -> { where featured: true }
  scope :upcoming, -> { where 'starts_at >= ?', Time.now }

  private

  def image_size
    return if cover_image.size < 5.megabytes
    errors.add(:cover_image, 'cannot be more than 5MB')
  end
end
