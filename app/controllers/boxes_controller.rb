class BoxesController < ApplicationController

  
  get '/boxes' do

    json :boxes => current_grid.boxes
  end

  # get '/boxes/new' do

  #   erb :'boxes/create'
  # end

  # post '/boxes' do

  #   json :result
  # end

  get '/boxes/:id' do
    json :box => current_grid.boxes.find(params[:id])
  end

  # get '/boxes/:id/edit' do
  #   erb :'users/show'
  # end

  patch '/boxes/:id' do
    b = current_grid.boxes.find(params[:id])
    if b.update(value: params[:value])
      json :box => b
    else
      json :errors => b.errors
    end
  end

  # delete '/boxes/:id' do
  #   json :result
  # end

end
