class Application < Sinatra::Base
  include Sprockets::Helpers

  get "/" do
    haml :index
  end

  get "/resume/" do
    haml :resume
  end
end