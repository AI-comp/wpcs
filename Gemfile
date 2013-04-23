source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mongoid"
gem "bson_ext"
gem "omniauth"
gem "omniauth-google"
gem "omniauth-twitter"
gem "redcarpet"
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.3.4'
gem 'settingslogic'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem "jquery-ui-rails", "~> 4.0.2"
  gem "jquery-timepicker-addon-rails", "~> 1.2.2"
  gem "autosize-rails", "~> 1.16.7"
end

gem 'jquery-rails'

group :development do
  gem 'faker'
end

group :development do
  # automatic reloader for changes
  gem 'guard-livereload'
  gem 'em-websocket'
end

group :test do
  # mock for HTTP requests
  gem 'webmock'

  # Matcher utility for Rspec
  gem 'shoulda-matchers'
end

group :development, :test do
  # Rspec
  gem 'rspec-rails'

  # instead of fixture
  gem 'factory_girl_rails'

  gem 'database_cleaner'
  # Fast rails server for testing
  gem 'spork'

  # Monitor for file changes (please install one of them by hand.)
  gem 'rb-inotify', :require => false # for Linux
  gem 'rb-fsevent', :require => false # for MacOS
  gem 'rb-fchange', :require => false # for Windows

  # Notifier to the Notification Center of Moutain Lion
  gem 'libnotify'               # for Linux   
  gem 'terminal-notifier-guard' # for MacOS (10.8)
  gem 'rb-notifu'               # for Windows

  # Guard for pow, rpsec, spork and bundler
  gem 'guard-pow'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-bundler'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
