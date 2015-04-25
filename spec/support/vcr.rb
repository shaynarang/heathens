VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<FACEBOOK_PAGE_ID>') { ENV['FACEBOOK_PAGE_ID'] }
  config.filter_sensitive_data('<FACEBOOK_APP_ID>') { ENV['FACEBOOK_APP_ID'] }
  config.filter_sensitive_data('<FACEBOOK_SECRET>') { ENV['FACEBOOK_SECRET'] }
end