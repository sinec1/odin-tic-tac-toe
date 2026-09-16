class Player
  attr_reader :name, :symbol,:score
  def initialize(name,symbol)
    @name = name
    @symbol = symbol
  end

  def updateScore()
    score += 1
  end
end