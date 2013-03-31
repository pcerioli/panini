source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#Whoops - I forgot heroku use pg :)
#There is also an current issue with rubyracer/libv8 versioning, so I had to patch it a bit
group :development, :test do
  gem 'mysql2'
end
group :production do
  gem 'pg'
end

gem 'thin' 

#gem 'libv8', '3.11.8.3'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

gem 'simple_form'
gem 'country_select'

gem 'jquery-rails'

#gem 'devise'

gem "less-rails" 
gem 'twitter-bootstrap-rails' #, :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem "rmagick"
gem "carrierwave"
#gem "selenium-webdriver"
#gem "imgkit"

gem 'cache_digests'

gem 'masonry-rails'

gem 'counter_culture'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails' #,   '~> 3.2.3'
  gem 'coffee-rails' #, '~> 3.2.1'

	#gem 'libv8', '3.11.8.3' #TO FIX A TEMPORARY ISSUE WITH RUBYRACER COMPILATION

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  #gem 'therubyracer', '0.10.2', :platforms => :ruby
  
  #gem 'libv8', '3.11.8.3' #TO FIX A TEMPORARY ISSUE WITH RUBYRACER COMPILATION
  #gem 'therubyracer', :platforms => :ruby
  gem 'therubyracer', '0.10.2', :platforms => :ruby

  gem 'uglifier' #, '>= 1.0.3'
  
  gem 'chosen-rails'
end


gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end


#gem 'acts-as-taggable-on', '~> 2.3.1'


# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
#gem 'unicorn'

# Deploy with Capistrano
#gem 'capistrano'

# To use debugger
#gem 'debugger'
#gem 'debugger', group: [:development, :test]

