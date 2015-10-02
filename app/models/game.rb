class Game < ActiveRecord::Base
  

  def in_stock?
    borrower.length == 0
  end  

  def return_game
    update(borrower: '')
  end  
end
