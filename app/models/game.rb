class Game < ActiveRecord::Base
  

  def in_stock?
    borrower.length == 0
  end  
end
