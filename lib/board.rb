class Board

  attr_accessor :cells, :board        #allows us to read and write to cells nad board instance variable.
  cells = []

  def initialize
    reset!                          #calls the reset! method. Sets the cells of the board to a 9 element array of " ".
  end

  def reset!
    @cells = Array.new(9, " ")      #creating a new array in our @cells(instance variable). 9 indicates the number of positions, " " indicates value in array positions.
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "       #printing our display board with the cell array are located in the correct position.
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)        #taking in a user input
    cells[user_input.to_i-1]     #calling cells array and placing the user input. Input comes as a string, .to_i converts to an intiger
  end

  def full?                       #question marks on methods indicated a true or false method
    if
      cells.all? do |token|        #.all? is checking to see if every single array position has a variable(token) in it.
        token == "X" || token == "O"
        end
      true
    else
      false
    end
  end

  def turn_count
    cells.count do |token|               #.count the number of elements for which the block returns a true value. Will equal turn count.
      token == "X" || token == "O"
    end
  end

  def taken?(user_input)
    position(user_input) != " "                 #call the position method to see if the user selected position is avialable.
    # postion(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
    !taken?(user_input) && user_input.to_i.between?(1,9)      #checks to see if position is not taken AND input is between 1-9
  end

  def update(user_input, player)                    #placing the players token into the position that was selected by player
    cells[user_input.to_i-1] = player.token         #player.token is setting the player's "token" to cell array position.
  end

end
