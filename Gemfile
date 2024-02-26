# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'activeadmin'
gem 'acts_as_votable'
gem 'bootstrap'
gem 'carrierwave', '~> 2.0'
gem 'devise'
gem 'friendly_id'
gem 'mini_magick'
gem 'pagy'
gem 'ransack'
gem 'redis', '< 4.6'
gem 'resque'
gem 'sassc-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
