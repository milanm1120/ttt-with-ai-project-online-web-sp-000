module Players
  class Human < Player              #Human class inheriting from Player class

    def move(board)                 #making a move on the board
      puts "Please enter you selection."
      gets.strip
    end

  end
end
