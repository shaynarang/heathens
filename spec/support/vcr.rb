VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<FACEBOOK_PAGE_ID>') { ENV['FACEBOOK_PAGE_ID'] }
  config.filter_sensitive_data('<FACEBOOK_APP_ID>') { ENV['FACEBOOK_APP_ID'] }
  config.filter_sensitive_data('<FACEBOOK_SECRET>') { ENV['FACEBOOK_SECRET'] }
  config.filter_sensitive_data('<TWITTER_CONSUMER_KEY>') { ENV['TWITTER_CONSUMER_KEY'] }
  config.filter_sensitive_data('<TWITTER_CONSUMER_SECRET>') { ENV['TWITTER_CONSUMER_SECRET'] }
  config.filter_sensitive_data('<TWITTER_ACCESS_TOKEN>') { ENV['TWITTER_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<TWITTER_ACCESS_SECRET>') { ENV['TWITTER_ACCESS_SECRET'] }
  config.filter_sensitive_data('<INSTAGRAM_CLIENT_ID>') { ENV['INSTAGRAM_CLIENT_ID'] }
end