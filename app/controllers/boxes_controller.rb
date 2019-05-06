class BoxesController < ApplicationController

  helpers Sinatra::JSON
  configure do
    set :json_encoder, :to_json
  end

  get '/grids/:grid_id/boxes' do

    json :boxes => Box.where(:grid_id => params[:grid_id])
  end

  # get '/boxes/new' do

  #   erb :'boxes/create'
  # end

  # post '/boxes' do

  #   json :result
  # end

  # get '/boxes/:id' do
  #   json :box => @box
  # end

  # get '/boxes/:id/edit' do
  #   erb :'users/show'
  # end

  patch '/boxes/:id' do
    json :result
  end

  # delete '/boxes/:id' do
  #   json :result
  # end

end

# class GamesController < ApplicationController
#   before_action :set_game, only: [:show, :update]

#   def index
#     games = Game.all
#     render json: games
#   end

#   def show
#     render json: @game
#   end

#   def create
#     game = Game.create(game_params)
#     render json: game, status: 201
#   end

#   def update
#     @game.update(game_params)
#     render json: @game
#   end

#   private

#   def game_params
#     params.permit(state: [])
#   end

#   def set_game
#     @game = Game.find(params[:id])
#   end
# end