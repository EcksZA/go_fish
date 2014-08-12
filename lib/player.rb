class Player
  attr_accessor :name, :current_deck

  def initialize(hash)
    @name = hash[:name]
    @current_deck = []
  end

  def add_card(new_card)
      moved_card = new_card
      @current_deck << moved_card
  end

end
