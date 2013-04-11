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

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'faker'
end

group :development do
  # view$B$d(Bcss$B$NJQ99$r4F;k$7$F%V%i%&%6$r<+F0E*$K%j%m!<%I$9$k(B
  gem 'guard-livereload'
  gem 'em-websocket'
end

group :test do
  # HTTP requests$BMQ$N%b%C%/%"%C%W$r:n$C$F$/$l$k(B
  gem 'webmock'

  # $BJXMx%^%C%A%c!<=8(B
  gem "shoulda-matchers"
end

group :development, :test do
  # Rspec
  gem 'rspec-rails'

  # fixture$B$NBe$o$j(B
  gem "factory_girl_rails"

  # $B%F%9%H4D6-$N%F!<%V%k$r$-$l$$$K$9$k(B
  gem 'database_cleaner'

  # $B@_Dj$r%m!<%I$7$?%5!<%P!<$K$h$C$F%F%9%H$r9bB.2=(B
  gem 'spork'

  # $B%U%!%$%k$NJQ99$r8!CN$9$k!#(BOSX$BMQ(B
  gem 'rb-fsevent'

  # $B%F%9%H7k2L$rDLCN%;%s%?!<$KI=<($9$k(B(Mountain Lion$B8~$1(B)
  gem 'terminal-notifier-guard'

  # $B%U%!%$%k$NJQ99$r4F;k$7$F(BPow$B%5!<%P$r:F5/F0(B
  gem 'guard-pow'

  # $B%U%!%$%k$NJQ99$r4F;k$7$F%F%9%H$r<+F02=(B
  gem 'guard-rspec'

  # $B@_Dj%U%!%$%k$NJQ99$r4F;k$7$F%F%9%H%5!<%P!<$r:F5/F0(B
  gem 'guard-spork'

  # Gemfile$B$r4F;k$7$F!"JQ99$,$"$C$?$i<+F0$G(Bbundle install$B$r<B9T(B
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
