class Game
  def initialize(player1, player2)
    @rack = [[], [], [], [], [], [], []]
    @white_player, @black_player = randomize_players(player1, player2)
  end

  def winner?
    false
  end

  def rack
    #
    temp1 = @rack.dup

    @rack.
      map { |col| col.concat(["-"] * (6 - col.length)) }.
      map { |col| col.join  } #.transpose.map { |row| row.join() }

    #
    #temp2 = @rack.dup

    
    #if temp1 == temp2
    #  puts "good"
    #else
    #  puts "bad"
    #end
    
    #@rack
  end

private
  def randomize_players(p1, p2)
  end
end
