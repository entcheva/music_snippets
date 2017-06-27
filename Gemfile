source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "clearance"
gem 'jquery-rails'
gem "paperclip"
gem 'pg'
gem 'puma'
gem 'rails'
gem "rspotify"
gem 'simple_form'
gem "slim"
gem 'turbolinks'

group :assets do
  gem 'bourbon'
  gem 'coffee-rails'
  gem 'neat'
  gem 'sass-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'database_cleaner'
  gem "dotenv-rails"
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'pry'
  gem "rails-controller-testing"
  gem 'rspec-rails'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem "rubycritic", :require => false
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
