class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  
  assets do
    serve '/stylesheets', :from => 'stylesheets'
    serve '/javascripts', :from => 'javascripts'
    serve '/images', :from => 'images'

    css :application, [ '/stylesheets/*.css' ]
    js :application, [ '/javascripts/*.js' ]
  end

  get "/" do
    haml :index
  end

  get "/resume/" do
    haml :resume
  end
end