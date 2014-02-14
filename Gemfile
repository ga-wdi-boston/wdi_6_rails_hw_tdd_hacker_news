source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'pg'
gem 'dotenv-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'simplecov', require: false, group: :test
gem 'newrelic_rpm'
gem 'bootstrap-sass', '~> 3.1.0'

# These are gems you may find useful for testing
# I have NOT created configuration in the /spec directory for you
# You'll have to refer to your notes for spec_helper configuration
group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'faker'
  gem 'chronic'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'guard-rspec', require: false
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
end

# Other gems you may find useful for development
group :development do
  gem 'bullet'
  gem 'time_difference'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'debugger'
  gem 'lol_dba'
  gem 'meta_request'
  gem 'quiet_assets'
  # gem 'rack-mini-profiler'
  gem 'rails-erd', require: false
  gem 'rails_best_practices', require: false
  gem 'rails-footnotes'
  gem 'smusher'
end

gem 'rails_12factor', group: :production
