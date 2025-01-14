source "https://rubygems.org"

ruby "2.1.2"

gem "bourbon", "~> 3.2.1"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "neat", "~> 1.5.1"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.4"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem "ckeditor"
gem "devise"
gem 'cancancan', '~> 1.9'
gem "paperclip"

group :development do
  gem "foreman"
  gem "spring"
  gem "spring-commands-rspec"
  gem "better_errors"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 2.14.0"
  gem "guard"
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
  gem "stripe-ruby-mock"
end

group :staging, :production do
  gem 'rails_12factor'
  gem "newrelic_rpm", ">= 3.7.3"
  gem "rack-cache"
  gem "dalli"
  gem "kgio"
end
