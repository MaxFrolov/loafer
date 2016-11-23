# encoding: utf-8

class AvatarUploader < BaseUploader
  include CarrierWave::MiniMagick

  process convert: 'jpg'

  version :medium do
    process resize_to_fill: [440, 440]
  end

  version :small do
    process resize_to_fill: [128, 128]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "image_#{secure_token}.jpg" if original_filename.present?
  end

end
