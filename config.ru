require 'rubygems'
require 'bundler'

Bundler.require

require './app/application.rb'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'vendor/twitter-bootstrap/lib'
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'app/assets/images'
  Sprockets::Helpers.environment = environment
  run environment
end

map '/' do
  run Application
end