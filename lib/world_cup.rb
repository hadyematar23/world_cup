class WorldCup
          attr_reader :year
          attr_accessor :teams_playing

  def initialize(year, teams_playing)
    @year = year 
    @teams_playing = teams_playing.select {|team| team.eliminated == false}
  end

  def active_players_by_position(position)
     @teams_playing.flat_map do |team|
      team.players_by_position(position)
    end
  end

  def all_players_by_position
    new_hash = Hash.new

    @teams_playing.each do |team|
      team.players.each do |player|
        new_hash[player.position] = []
      end
    end
    @teams_playing.each do |team|
      team.players.each do |player|
        new_hash[player.position] << team.players_by_position(player.position)
      end
    end

    flattened = new_hash.transform_values do |value|
       value.flatten
    end
    return flattened
  end

end 




