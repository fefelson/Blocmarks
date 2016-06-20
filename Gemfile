source 'https://rubygems.org'


gem 'rails', '4.2.6'   # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails', '~> 5.0'   # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'   # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'   # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'   # Use jquery as the JavaScript library
gem 'turbolinks'   # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'bootstrap-sass'   # Sass powered version of the bootstrap html, css, and javascript framework
gem 'pry'   # Powerful alternative to the standard interactive ruby shell
gem 'devise'   # Flexible authentication solution
gem 'figaro', '1.0'   # Makes it easy to securly configure rails applications
gem 'faker'   # Adds random data for development and testing
gem 'pundit'   # Set of helpers to provide a simple, robust and scaleable authorization system
group :production do
  gem 'pg'   # The ruby interface to the PostgreSQL RDBMS
  gem 'rails_12factor'   # Enables serving assets in production and setting your logger to standard out
end

group :development do
  gem 'sqlite3'   # Use sqlite3 as the database for Active Record
end

group :development, :test do
  gem 'spring'   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rspec-rails','~>3.0'   # A testing framework for rails
  gem 'shoulda-matchers','~>3.0'   # Provides RSpec one-liners that test common Rails functionality.
  gem 'pry-rails'   # Causes rails console to open pry
  gem 'pry-byebug'   # Adds step-by-step debugging adn stack navigation capabilities to pry using byebug
  gem 'better_errors'   # Replaces the standard Rails error page with a much better and more useful error page
  gem 'binding_of_caller'   # Provides the Binding#of_caller method
	gem 'factory_girl_rails', '~> 4.0'   # A fixtures replacement with a straightforward definition syntax, support for multiple build strategies, and support for multiple factories for the same class
end
