if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config| 
    config.storage = :fog
    config.fog_credentials = { 
      provider: 'AWS', 
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], 
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-west-2'
    } 
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_public = false 
  end 
end