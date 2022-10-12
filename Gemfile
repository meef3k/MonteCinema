source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'

gem 'sprockets-rails'

gem 'dotenv-rails', '~> 2.8.1'

gem 'pagy', '~> 5.10'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'jsbundling-rails'

gem 'cssbundling-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'devise', '~> 4.8.1'

gem 'pundit', '~> 2.2.0'

gem 'redis', '~> 4.8'

gem 'sidekiq', '~> 6.5'

gem 'sidekiq-cron', '~> 1.8.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.23.0'
  gem 'rspec-rails', '~> 5.1.2'
  gem 'rubocop', '~> 1.36', require: false
end

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'web-console'
end

group :test do
  gem 'rspec-sidekiq', '~> 3.1.0'
  gem 'simplecov', '~> 0.21.2', require: false
end
