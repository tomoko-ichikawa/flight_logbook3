CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWSAccessKeyId"],
      aws_secret_access_key: ENV["AWSSecretKey"],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = false
  config.fog_authenticated_url_expiration = 60
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'flight-logbook3-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/flight-logbook3-production'
    when 'development'
      config.fog_directory = 'flight-logbook3-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/flight-logbook3-development'
  end
end