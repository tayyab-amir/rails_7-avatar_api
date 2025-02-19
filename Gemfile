source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'  # ✅ Upgraded to Ruby 3.2.2

# Use latest stable Rails 7
gem 'rails', '~> 7.1'

# Use PostgreSQL as the database for Active Record
gem 'pg', '>= 1.1', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 5.0'  # ✅ Upgraded for Rails 7 compatibility

# Background processing
gem 'sidekiq', '~> 7.0'  # ✅ Updated for Rails 7 compatibility
gem 'redis', '>= 4.0'

# Swagger documentation
gem 'rswag-api'   # API specs
gem 'rswag-ui'    # Swagger UI for API docs
gem 'rswag-specs' # Swagger documentation
gem 'image_processing', '~> 1.2'
gem 'activestorage'

# Optimize Rails boot time
gem 'bootsnap', '>= 1.16.0', require: false  # ✅ Updated for Ruby 3+

group :development, :test do
  # Debugging
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rswag-specs'
end

group :development do
  # Live reload for development
  gem 'listen', '~> 3.2'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
