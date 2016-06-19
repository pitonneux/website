# frozen_string_literal: true
class Organization < ActiveRecord::Base
  has_one :location
  mount_uploader :logo, LogoUploader

  validate :logo_size

  validates_presence_of :name

  private

  def logo_size
    errors.add(:logo, 'cannot be more than 5MB') if logo.size > 5.megabytes
  end
end
