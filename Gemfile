source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt'
gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'simple_form'
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
  gem 'factory_girl'
  gem 'launchy'
  gem 'pry'
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
