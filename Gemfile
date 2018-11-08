source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'active_model_serializers'
gem 'awesome_print'
gem 'twilio-ruby', '~> 5.4.3'
gem 'will_paginate'
gem 'puma', '~> 3.7'
gem 'bitly'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'rack-attack'
gem 'slim'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # gem 'pry'
  gem 'pry-byebug'
  # Use RSpec for specs
  gem 'rspec-rails', '>= 3.5.0'
  gem 'factory_bot_rails'
  gem "letter_opener"
  # find missing translations
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :develop, :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'capistrano',  '~> 3.6'
  gem 'capistrano-rails',  '~> 1.3'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
  gem 'capistrano-slackify', require: false
  gem 'annotate'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
