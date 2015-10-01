class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path 
    else
      render :show
    end     
  end  
  
  def show
    @game = Game.find(params[:id])
  end  

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to new_game_path
    else
      render :new  
    end  
  end  

  private
  def game_params
    params.require(:game).permit(:id, :title, :borrower)
  end  
end
