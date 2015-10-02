class Game < ActiveRecord::Base
  
  def in_stock?
    borrower.length == 0
  end  

  def return_game
    update(borrower: '')
  end  

  def pretty_date
    if date_borrowed
      year, month, day = date_borrowed.split('-').map(&:to_i)
      date = Date.new(year, month, day)
      pretty_date = date.strftime('%B %-d, %Y')
    end
  end  

end
