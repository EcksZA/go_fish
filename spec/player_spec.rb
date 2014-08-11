require 'spec_helper'

describe Player do
  it "initializes the object as an instance of the Player class" do
    player_1 = Player.new({:name => "Xolani"})
    expect(player_1).to be_an_instance_of Player
  end

  it "names the object" do
    player_1 = Player.new({:name => "Xolani"})
    expect(player_1.name).to eq "Xolani"
  end

  it "creates an empty array to hold the player's cards" do
    player_1 = Player.new({:name => "Xolani"})
    expect(player_1.current_deck).to eq []
  end
end
