require 'yaml'
require 'active_support/core_ext/array/grouping'

class Application < Sinatra::Base
  include Sprockets::Helpers

  get "/" do
    redirect "/resume"
  end

  get "/resume" do
    @technologies = YAML.load(File.open('data/technologies.yml'))
    @experience = YAML.load(File.open('data/experience.yml'))
    haml :resume
  end
end