module Players                        #overriding module that wraps around the entire class.
  class Computer < Player             #the class Computer inharents all of the functionality from the Player module

    def move(board)

      if !board.taken?(5)             #will take the #5 position if avialable.
        move = "5"

      elsif board.turn_count == 1     #takes the upper left position if the middle position is taken
        move = "1"

      elsif board.turn_count == 2     #takes an available corner position for player 1.
        move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
          move = "2"                  #if opposite corner squares are taken, taken the 2nd position if player has the center ("5") position.

      else
        Game::WIN_COMBINATION.detect do |combination|

                                      #checks to see if you have an opportunity to win.
          if combination.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
                     move = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

                                      #plays a move to block the opponent
          elsif combination.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combination.any?{|i| board.position(i+1) == " "}
           move = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
                                      #if none of the WIN_COMBINATION are an option, play into first open square.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end

end
