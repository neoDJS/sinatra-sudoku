class SudokuController < ApplicationController

    get '/index' do
  
      erb :'sudoku/index'
    end

    get '/sudoku/new' do
  
      erb :'sudoku/new'
    end  

    post '/sudoku' do
  
      erb :'sudoku/new'
    end  

    get '/sudoku/:id' do #partie complete
  
      erb :'sudoku/new'
    end  

    get '/sudoku/:id/edit' do #partie non complete
  
      erb :'sudoku/new'
    end  

    patch '/sudoku/:id' do 
  
      erb :'sudoku/new'
    end  

    delete '/sudoku/id' do
  
      erb :'sudoku/new'
    end  
  
  end