CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

  case Rails.env
  when 'production'
    config.fog_directory  = 'gy-baket'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/gy-baket'
  end
end