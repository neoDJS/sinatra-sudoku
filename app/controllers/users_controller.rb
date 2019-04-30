class UsersController < ApplicationController

    get '/login' do
      redirect '/index' if logged_in?
  
      erb :'users/login'
    end
  
    post '/login' do
      # if logged_in?
      #   @user= User.find(session[:user_id])
      # else
        user = User.find_by(:name=>params[:user][:name])
      # end
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
  
        redirect '/sudoku'
      else
        redirect '/login'
      end
    end
  
    get '/signup' do
      redirect '/sudoku' if logged_in?
  
      erb :'users/create'
    end
  
    post '/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
  
        redirect '/sudoku'
      else
        redirect '/signup'
      end
    end
  
    get '/users/:slug' do
      erb :'users/show'
    end
  
    get '/logout' do
      session.clear
      redirect '/login'
    end
  
  end