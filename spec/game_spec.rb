require 'spec_helper'

describe Game do
  it "initializes the object as an instance of the Game class, the deck of cards and an empty current deck array" do
    go_fish = Game.new({:name => "Go Fish"})
    expect(go_fish).to be_an_instance_of Game
  end

  it "names the object" do
    go_fish = Game.new({:name => "Go Fish"})
    expect(go_fish.name).to eq "Go Fish"
  end

  it "returns true if there are still cards in the deck, false if the deck is empty" do
    go_fish = Game.new({:name => "Go Fish"})
    expect(go_fish.deck_in_play?).to eq true
  end

  it "chooses random cards to pass to the player's current deck" do
    go_fish = Game.new({:name => "Go Fish"})
    go_fish.pass_cards = 7
    expect(go_fish.current_deck.length).to eq 7
  end

end
