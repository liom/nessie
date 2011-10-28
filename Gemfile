source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

gem 'ipaddress'

gem 'pry'

# To use debugger
group :development do
  # gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'watchr'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'spork', '~> 0.9.0.rc'
end

group :console do
  gem 'wirble'
  gem 'hirb'
  gem 'awesome_print'
  gem 'looksee'
end
