source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'normalize-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# handle authentication using Devise
gem 'devise', '~> 4.2.1'
gem 'omniauth-facebook', '~> 4.0.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 9.0.6', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'figaro', '~> 1.1.1'
  gem 'guard-rspec', '~> 4.7.3', require: false
  gem 'rails-controller-testing', '~> 1.0.1'
  gem 'letter_opener', '~> 1.4.1'
  gem 'rubocop', '~> 0.48.1', require: false
  gem 'reek', '~>4.6.1'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'capybara', '~> 2.10'
  gem 'vcr'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'webmock', '~>3.0.1'
  gem 'simplecov', :require => false
  gem 'database_cleaner', '~> 1.5.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~> 2.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2.3', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
