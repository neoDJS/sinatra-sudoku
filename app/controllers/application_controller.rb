require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :root, File.dirname(__FILE__)
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      User.find(session[:user_id]) if logged_in?
    end

    def logged_in?
      !!session[:user_id]
    end
  end

end