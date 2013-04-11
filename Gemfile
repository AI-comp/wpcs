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
  # viewやcssの変更を監視してブラウザを自動的にリロードする
  gem 'guard-livereload'
  gem 'em-websocket'
end

group :test do
  # HTTP requests用のモックアップを作ってくれる
  gem 'webmock'

  # 便利マッチャー集
  gem "shoulda-matchers"
end

group :development, :test do
  # Rspec
  gem 'rspec-rails'

  # fixtureの代わり
  gem "factory_girl_rails"

  # テスト環境のテーブルをきれいにする
  gem 'database_cleaner'

  # 設定をロードしたサーバーによってテストを高速化
  gem 'spork'

  # ファイルの変更を検知する。OSX用
  gem 'rb-fsevent'

  # テスト結果を通知センターに表示する(Mountain Lion向け)
  gem 'terminal-notifier-guard'

  # ファイルの変更を監視してPowサーバを再起動
  gem 'guard-pow'

  # ファイルの変更を監視してテストを自動化
  gem 'guard-rspec'

  # 設定ファイルの変更を監視してテストサーバーを再起動
  gem 'guard-spork'

  # Gemfileを監視して、変更があったら自動でbundle installを実行
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
