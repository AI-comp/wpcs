source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'thin', '1.6.2'
gem 'bson_ext', '1.10.1'
gem 'redcarpet', '3.1.2'
gem 'sqlite3', '1.3.9'

# for authentication
gem 'omniauth', '1.2.1'
gem 'omniauth-google', '1.0.2'
gem 'omniauth-twitter', '1.0.1'

# for image uploader
gem 'paperclip', '4.1.1'

# for retrieving markdown example from yml file
gem 'settingslogic', '2.0.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass', '3.2.13'
  gem 'sass-rails', '3.2.6'
  gem 'coffee-rails', '3.2.2'

  # for Bootstrap
  gem 'therubyracer', '0.12.1'
  gem 'less-rails', '2.5.0'
  gem 'twitter-bootstrap-rails', '2.2.8'

  # for jQuery UI / Timepicker
  gem 'jquery-ui-rails', '4.2.1'
  gem 'jquery-timepicker-addon-rails', '1.4.1'

  gem 'autosize-rails', '1.18.17'
  gem 'uglifier', '2.5.0'
end

gem 'jquery-rails', '3.1.0'

group :development do
  gem 'faker', '1.3.0'
  gem 'em-websocket', '0.5.1'

  # automatic reloader for changes
  gem 'guard', '2.6.1'

  # automatic reloader for changes
  gem 'guard-livereload', '2.1.2'

  # Guard for pow, rpsec, spork and bundler
  gem 'guard-pow', '2.0.0'
  gem 'guard-rspec', '4.2.9'
  gem 'guard-spork', '1.5.1'
  gem 'guard-bundler', '2.0.0'

  # Monitor for file changes (please install one of them by hand.)
  gem 'rb-inotify', :require => false # for Linux
  gem 'rb-fsevent', :require => false # for MacOS
  gem 'rb-fchange', :require => false # for Windows

  # Notifier to the Notification Center of Moutain Lion
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM # for Linux
  gem 'terminal-notifier-guard' if /darwin/ =~ RUBY_PLATFORM # for MacOS (10.8)
  gem 'rb-notifu'               # for Windows
end

group :test do
  # Fast rails server for testing
  gem 'spork', '0.9.2'

  # mock for HTTP requests
  gem 'webmock','1.18.0'

  # Matcher utility for Rspec
  gem 'shoulda-matchers', '2.6.1'

  # For coveralls
  gem 'coveralls', '0.7.0', :require => false

  # Browser testing framework
  gem 'capybara', '2.2.1'

  # For performance testing
  gem 'test-unit', '2.5.5'
  gem 'ruby-prof', '0.15.1'
end

group :development, :test do
  # Diagram generator
  gem 'railroady', '1.1.1'

  # Rspec
  gem 'rspec-rails', '2.14.2'

  # instead of fixture
  gem 'factory_girl_rails', '4.4.1'

  gem 'database_cleaner', '1.2.0'
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
