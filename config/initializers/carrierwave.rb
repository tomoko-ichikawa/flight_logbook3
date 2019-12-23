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

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = '本番環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/本番環境用のバケット名'
    when 'development'
      config.fog_directory = '開発環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/開発環境用のバケット名'
  end
end