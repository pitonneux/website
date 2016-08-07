# frozen_string_literal: true
class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'png'
  process tags: ['logo']
  process resize_to_limit: [400, 400]

  def store_dir
    "/#{model.name}/#{model.id}/logo"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
