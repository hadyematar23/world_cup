require './lib/player'

RSpec.describe Player do 
  context "happy paths" do 
    let(:player) {Player.new({name: "Luka Modric", position: "midfielder"})}

    it "is a player object" do 
    
      expect(player).to be_an_instance_of(Player)
    end

    it "has a name" do 

      expect(player.name).to eq("Luka Modric")
    end

    it "has a position" do 

      expect(player.position).to eq("midfielder")

    end 

















  end
end