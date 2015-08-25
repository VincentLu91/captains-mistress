class Game
  def initialize(player1, player2)
    @rack = [[], [], [], [], [], [], []]
    @white_player, @black_player = randomize_players(player1, player2)
  end

  def winner?
    false
  end

  def rack
    the_rack = Marshal.load(Marshal.dump(@rack))
    the_rack.map { |col| col.concat(["-"] * (6 - col.length)) }
         .map { |col| col.join }
  end

private
  def randomize_players(p1, p2)
  end
end
