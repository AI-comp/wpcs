source 'https://rubygems.org'

gem 'rails', '~> 3.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'thin'
gem 'bson_ext'
gem 'redcarpet'
gem 'sqlite3'

# for authentication
gem 'omniauth'
gem 'omniauth-google'
gem 'omniauth-twitter'

# for image uploader
gem "paperclip", "~> 4.1"

# for retrieving  markdown example from yml file
gem 'settingslogic'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # for Bootstrap
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'

  # for jQuery UI / Timepicker
  gem 'jquery-ui-rails'
  gem 'jquery-timepicker-addon-rails'

  gem 'autosize-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :development do
  gem 'faker'
  gem 'em-websocket'

  # automatic reloader for changes
  gem 'guard'

  # automatic reloader for changes
  gem 'guard-livereload'

  # Guard for pow, rpsec, spork and bundler
  gem 'guard-pow'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-bundler'

  # Monitor for file changes (please install one of them by hand.)
  gem 'rb-inotify', :require => false # for Linux
  gem 'rb-fsevent', :require => false # for MacOS
  gem 'rb-fchange', :require => false # for Windows

  # Notifier to the Notification Center of Moutain Lion
  gem 'libnotify'               # for Linux   
  gem 'terminal-notifier-guard' # for MacOS (10.8)
  gem 'rb-notifu'               # for Windows
end

group :test do
  # Fast rails server for testing
  gem 'spork'

  # mock for HTTP requests
  gem 'webmock'

  # Matcher utility for Rspec
  gem 'shoulda-matchers'

  # For coveralls
  gem 'coveralls', :require => false

  # Browser testing framework
  gem 'capybara'
end

group :development, :test do
  # Diagram generator
  gem 'railroady'

  # Rspec
  gem 'rspec-rails'

  # instead of fixture
  gem 'factory_girl_rails'

  gem 'database_cleaner'
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
