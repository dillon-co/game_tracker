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

  def bounty_message
    messages = ['has given in willingly.',
                'was incredibly stubborn so we broke their legs and took the game.',
                "offered their firstborn son to keep this. we told 'em no.",
                'tried running with this, luckily we brought our tazers',
                "was having a date night that we interupted, but that's okay I don't think they were meant for eachother anyway", 
                "fed us cookies so we wouldn't beat 'em up... we did anyways, but only a little :)"]
    messages.sample
  end  
end
