class SudokuController < ApplicationController

    get '/sudoku' do
      redirect '/login' unless logged_in?
      
      @userGames = current_user.grids
      erb :'sudoku/index'
    end

    get '/sudoku/new' do
      redirect '/login' unless logged_in?

      sudoku = Grid.new(user_id: current_user.id)
      if sudoku.save
        redirect "/sudoku/#{sudoku.id}"
      else
        @error = sudoku.errors
        erb :error
      end
    end  

    get '/sudoku/:id/renew' do
      redirect '/login' unless logged_in?

      sudoku = Grid.find_by({user_id:current_user.id, id:params[:id]})
      if sudoku.reset
        redirect "/sudoku/#{sudoku.id}"
      else
        @error = sudoku.errors
        erb :error
      end
    end  

    get '/sudoku/:id' do 
      redirect '/login' unless logged_in?

      @sudoku = Grid.find_by({user_id:current_user.id, id:params[:id]})
      session[:grid_id] = @sudoku.id
      erb :'sudoku/show'
    end 

    patch '/sudoku/:id' do 
      redirect '/login' unless logged_in?

      @sudoku = Grid.find_by({user_id:current_user.id, id:params[:id]})
      redirect "/sudoku/#{sudoku.id}"
    end  

    delete '/sudoku/:id' do
      redirect '/login' unless logged_in?
      session.delete(:grid_id)

      @sudoku = Grid.find_by({user_id:current_user.id, id:params[:id]})
      redirect "/sudoku"
    end  
  
  end