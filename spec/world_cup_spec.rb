require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do 
  context "happy paths" do 
  let(:team){Team.new("France")} 
  let(:mbappe){Player.new({name: "Kylian Mbappe", position: "forward"})}
  let(:pogba){Player.new({name: "Paul Pogba", position: "midfielder"})}
  let(:croatia){Team.new("Croatia")}
  let(:france){Team.new("France")}
  let(:modric){Player.new({name: "Luka Modric", position: "midfielder"})}
  let(:vida){Player.new({name: "Domagoj Vida", position: "defender"})}
  let(:world_cup){WorldCup.new(2018, [france, croatia])}

  it "is a team and there are players" do

    expect(croatia).to be_an_instance_of(Team)
    expect(modric).to be_an_instance_of(Player)
    expect(vida).to be_an_instance_of(Player)

  end

  it "croatia has two players on its team" do 
    croatia.add_player(vida)  
    croatia.add_player(modric)  

    expect(croatia.players).to include(vida, modric)
  end

  it "is in the year 2018" do 

    expect(world_cup.year).to eq(2018)
  
  end

  it "the teams taking part are france and croatia" do 

    expect(world_cup.teams_playing).to include(france, croatia)

  end

  it "the active players are listed by position" do 
    france.add_player(mbappe) 
    france.add_player(pogba) 
    croatia.add_player(modric) 
    croatia.add_player(vida)  

    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
    
  end

  it "reacts dynamically when a team is eliminated" do 
    france.add_player(mbappe) 
    france.add_player(pogba) 
    croatia.add_player(modric) 
    croatia.add_player(vida)  
    croatia.eliminated = true
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    
  end

  it "lists all players by position" do 

    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)

    expect(world_cup.all_players_by_position).to eq({
      "forward" => [mbappe], 
      "midfielder"=>[pogba, modric], 
      "defender"=>[vida]
    })

  end

end 
end 