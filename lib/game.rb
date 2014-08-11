class Game
  attr_accessor :name, :deck, :current_deck

  def initialize(hash)
    @name = hash[:name]
    @deck = ["2H", "2D", "2S", "2C", "3H", "3D", "3S", "3C", "4H", "4D", "4S", "4C", "5H", "5D", "5S", "5C",
             "6H", "6D", "6S", "6C", "7H", "7D", "7S", "7C", "8H", "8D", "8S", "8C", "9H", "9D", "9S", "9C",
             "10H", "10D", "10S", "10C", "JH", "JD", "JS", "JC", "QH", "QD", "QS", "QC", "KH", "KD", "KS", "KC",
             "AH", "AD", "AS", "AC"]
    @current_deck = []
  end

  def deck_in_play?
    @deck.length > 0
  end

  def pass_cards=(number)
    count = 1
    loop do
      moved_card = @deck.sample
      @current_deck << moved_card
      @deck.delete(moved_card)
      break if count == number
      count += 1
    end
  end

  def add_player(object)
    @current_deck << object
  end

end
