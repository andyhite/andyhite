require 'yaml'
require 'active_support/core_ext/array/grouping'

class Application < Sinatra::Base
  include Sprockets::Helpers
  enable :sessions
  register Sinatra::Flash

  ENV['MAIL_TO_ADDRESS'] ||= "andrew@andrew-hite.com"

  get "/" do
    redirect "/resume"
  end

  get "/resume" do
    @technologies = YAML.load(File.open('data/technologies.yml'))
    @experience = YAML.load(File.open('data/experience.yml'))
    haml :resume
  end

  get "/contact" do
    haml :contact
  end

  post "/contact" do
    Pony.mail(:to => ENV['MAIL_TO_ADDRESS'],
              :from => "#{params[:contact][:name]} <#{params[:contact][:email]}>",
              :subject => "andyhite.com - Message from #{params[:contact][:name]}",
              :body => haml(:contact_email, :layout => false))
    flash[:modal] = { 
      :header => "Thanks!", 
      :body => "Your message has been sent. I'll get back to you as soon as humanly possible! Unless I'm sleeping..." }
    redirect "/resume"
  end
end