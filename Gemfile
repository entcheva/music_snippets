source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg'
gem 'puma'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bcrypt'

group :assets do
  gem 'sass-rails'
  gem 'uglifier'
  gem 'coffee-rails'
  gem 'bourbon'
  gem 'neat'
end

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem "rubycritic", :require => false
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
