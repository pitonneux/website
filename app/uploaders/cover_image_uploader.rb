class CoverImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: ['cover_image']
  process resize_to_limit: [400, 400]

  def store_dir
    "/#{model.class.to_s.underscore}/#{modle.name}/#{model.id}/cover"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
