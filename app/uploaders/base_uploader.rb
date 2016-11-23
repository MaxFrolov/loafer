# encoding: utf-8

class BaseUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{Rails.env.test? ? 'test/' : ''}#{model.class.to_s.underscore}/#{mounted_as}/#{model.id/1000}/#{model.id}"
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(8))
  end
end
