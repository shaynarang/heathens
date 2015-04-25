ruby '2.1.2'

source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'
gem 'haml-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'figaro'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'active_attr'
gem 'fancybox-rails'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem "rack-livereload", :group => :development
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
end