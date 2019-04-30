class BoxesController < ApplicationController

    get '/boxes' do
  
      erb :'users/login'
    end
  
    get '/boxes/new' do
  
      erb :'users/create'
    end
  
    post '/boxes' do

        redirect '/sudoku'
    end
  
    get '/boxes/:id' do
      erb :'users/show'
    end
  
    get '/boxes/:id/edit' do
      erb :'users/show'
    end
  
    patch '/boxes/:id' do
      redirect '/sudoku'
    end
  
    delete '/boxes/:id' do
      redirect '/login'
    end
  
  end