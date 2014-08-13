require 'spec_helper'

describe Player do
  it "initializes the object as an instance of the Player class with name and a empty current deck array" do
    player_1 = Player.new({:name => "Xolani"})
    expect(player_1).to be_an_instance_of Player
  end

  it "names the object" do
    player_1 = Player.new({:name => "Xolani"})
    expect(player_1.name).to eq "Xolani"
  end

  it "adds a card to the players deck if told to go fish" do
    go_fish = Game.new({:name => "Go Fish"})
    player_1 = Player.new({:name => "Xolani"})
    go_fish.card_hold
    player_1.add_card(go_fish.card_hold)
    expect(player_1.current_deck.length).to eq 1
  end

  it "checks if a player has a complete set and returns a score for the player" do
    go_fish = Game.new({:name => "Go Fish"})
    player_1 = Player.new({:name => "Xolani"})
    player_1.current_deck << "AS"
    player_1.current_deck << "AD"
    player_1.current_deck << "AC"
    player_1.current_deck << "AH"
    player_1.current_deck << "2H"
    expect(player_1.score).to eq 1
  end
end
