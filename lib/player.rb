class Player

  attr_reader :token          #token cannout be changes once assigned in initialize as we used an attr_reader

  def initialize(token)
    @token = token            #when we initialize a player, the game knowns each player has a specific token
  end

end
