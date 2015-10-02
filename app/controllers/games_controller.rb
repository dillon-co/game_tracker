class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def return
    @game = Game.find(params[:id])
    @game.return_game
    redirect_to root_path
  end  

  def loaned_games
    @games = Game.all.select {|game| game.borrower.length > 0}
  end

  def available_games
    @games = Game.all.select {|game| game.borrower.length == 0 }
  end  

  def edit
    @game = Game.find(params[:id])
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

  def destroy
    @game = Game.find(params[:id])
    @game.destroy 
    redirect_to root_path
  end  

  private
  def game_params
    params.require(:game).permit(:id, :title, :borrower, :date_borrowed)
  end  
end
