source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=shadowkeeper_rails_4_0

gem 'rails', '~> 4.0.8'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'sprockets', '~> 2.11.0'
gem 'bcrypt', '~> 3.1.2'

group :development, :test do
  gem 'sqlite3', '~> 1.3.9'
  gem 'rspec-rails', '~> 2.14.2'
  gem 'guard-rspec', '~> 2.5.0'
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :test do
  gem 'selenium-webdriver', '~> 2.42.0'
  gem 'capybara', '~> 2.2.1'
  gem 'factory_girl_rails', '~> 4.2.0'
end

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :production do
  gem 'unicorn', '~> 4.8.3'
  gem 'pg', '~> 0.17.1'
end

group :doc do
  gem 'sdoc', require: false
end
