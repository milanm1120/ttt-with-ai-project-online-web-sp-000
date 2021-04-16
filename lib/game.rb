class Game

  attr_accessor :board, :player_1, :player_2  #provides access to board, player 1 and player 2.

  WIN_COMBINATIONS = [                        # defines winning combintations
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)     #Players(module)::Human(class) and initialize there assigned "token"
    @board = board
    @player_1 = player_1                    #accepts 2 plays and a board. Default is 2 human plays with player 1 default as "X" and player 2 default as "O" and empty board defined.
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.odd? ? player_2 : player_1      #@board calls from the Board class. Inside the board class, calls turn_count method.
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|                              # .detect finds one matching element
      @board.cells[combination[0]] == @board.cells[combination[1]] &&     #calling our board array, and calling the particular cell we are looking for
      @board.cells[combination[1]] == @board.cells[combination[2]] &&     #For each winning combintation, comparing the position of the first, second, and thrid cell of the array
      @board.taken?(combination[0] + 1)                                   #
     end
  end

  def draw?
    !won? && @board.full?                 #our board is full AND no winner = draw
  end

  def over?
    draw? || won?                         #game over if draw or win
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Select a position between 1 - 9."
    @user_input = current_player.move(@board)
    if
      @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else
      puts "Invalid move. Please enter a valid position."
      @board.display
      turn
    end
  end

  def play
    while !over?                  #asking for players input on a turn. And checking for win or draw.
      turn
    end
    if
      won?                        #checks for winner
      puts "Congratulations #{winner}!"
    elsif
      draw?                       #checks for draw
      puts "Cat's Game!"
    end
  end

end
