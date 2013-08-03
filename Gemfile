source 'https://rubygems.org'

gem 'rails',          '3.2.13'
gem "pg",             ">= 0.15.0"
gem "haml-rails",     ">= 0.4"
gem "devise",         ">= 2.2.3"
gem "cancan",         ">= 1.6.9"
gem "rolify",         ">= 3.2.0"
gem "simple_form",    ">= 2.1.0"
gem "figaro",         ">= 0.6.3"
gem 'jquery-rails'
gem 'httparty',       ">= 0.10.1"
gem 'rake',           ">= 10.1.0"
gem "therubyracer",   :require => 'v8'
# gem 'puma',          '>= 2.4.0'
gem 'thin',            '>= 1.5.1'
gem 'eventmachine',    '>= 1.0.3'
gem 'bundler'

group :assets do
  gem 'coffee-rails',   '~> 3.2.1'
  gem 'uglifier',       '>= 1.0.3'
  gem 'sass-rails',     '~> 3.2.3'
  gem 'bootstrap-sass', '>= 2.3.1.1'
  gem 'country_select', '>= 1.1.3'
end

group :development do
  gem "html2haml",          ">= 1.0.1"
  gem "quiet_assets",       ">= 1.0.2"
  gem "better_errors",      ">= 0.7.2"
  gem "binding_of_caller",  ">= 0.7.1", :platforms => [:mri_19, :mri_20, :rbx]
  gem "capistrano",         ">= 2.15.5"
  gem "rvm-capistrano"
end

group :development, :test do
  gem "rspec-rails",        ">= 2.12.2"
  gem "factory_girl_rails", ">= 4.2.0"
  gem 'annotate'
  gem 'spork'
  gem 'debugger'
end

group :test do
  gem "database_cleaner", ">= 1.0.0.RC1", :group => :test
  gem "email_spec",       ">= 1.4.0", :group => :test
  gem "cucumber-rails",   ">= 1.3.1", :group => :test, :require => false
  gem "launchy",          ">= 2.2.0", :group => :test
  gem "capybara",         ">= 2.0.3", :group => :test
  gem "shoulda",          ">= 3.5.0", :group => :test
end
