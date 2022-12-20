require './lib/player'
require './lib/team'

RSpec.describe Team do 
  context "happy paths" do 
  let(:team){Team.new("France")} 
  let(:mbappe){Player.new({name: "Kylian Mbappe", position: "forward"})}
  let(:pogba){Player.new({name: "Paul Pogba", position: "midfielder"})}

  it "is a team" do 

    expect(team).to be_an_instance_of(Team)

  end 

  it "belongs to a country" do 

    expect(team.country).to eq("France")

  end 

  it "starts out not being eliminated" do 

    expect(team.eliminated?).to eq(false)

  end 

  it "can be eliminated" do 

    team.eliminated = true
    
    expect(team.eliminated?).to eq(true)

  end 

  it "the team has various players" do 

    expect(team.players).to be_empty

  end 

  it "the team can add players" do 

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players).to include(mbappe, pogba)

  end 

  it "the team has one midfielder" do 

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players_by_position("midfielder")).to eq([pogba])

  end 

  it "the team has no defenders" do 

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players_by_position("defender")).to be_empty

  end 






  end 
end