class Player
  attr_reader :name, :current_deck

  def initialize(hash)
    @name = hash[:name]
    @current_deck = []
  end
end
