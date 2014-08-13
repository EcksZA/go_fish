require 'pry'

class Player
  attr_accessor :name, :current_deck, :score

  def initialize(hash)
    @name = hash[:name]
    @current_deck = []
    @score = 0
  end

  def add_card(new_card)
      moved_card = new_card
      @current_deck << moved_card
  end

  def score
    index = 0
    test_card = []
    @current_deck.each {|card| test_card << card.chop}

    test_card.each do |card|
      if test_card.count(card) == 4
        @current_deck.delete_if {|cut| cut[0] == card}
        test_card.delete(card)
        @score += 1
        index -= 1
      end
      index += 1
    end
    @score
  end

end
