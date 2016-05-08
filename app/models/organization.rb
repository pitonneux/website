class Organization < ActiveRecord::Base
  has_one :location
  mount_uploader :logo, LogoUploader

  validate :logo_size

  private

    def logo_size
      if logo.size > 5.megabytes
        errors.add(:logo, 'cannot be more than 5MB')
      end
    end
end
