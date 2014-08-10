class Game
  attr_accessor :name

  def initialize(hash)
    @name = hash[:name]
  end
end
