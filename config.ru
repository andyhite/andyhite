require 'rubygems'
require 'bundler'

Bundler.require

if ENV['RACK_ENV'] == "production"
  Pony.options = {
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  }
end

require './app/application.rb'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'vendor/twitter-bootstrap/lib'
  environment.append_path 'vendor/twitter-bootstrap/js'
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'app/assets/images'
  Sprockets::Helpers.environment = environment
  run environment
end

map '/' do
  run Application
end