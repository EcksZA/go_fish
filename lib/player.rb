class Player
  attr_reader :name

  def initialize(hash)
    @name = hash[:name]
  end

  def current_deck
    @current_deck = []
  end
end
