class Player
  attr_reader :name
  attr_accessor :score
  def initialize(name)
    @name = name
  end

  def updateScore()
    score += 1
  end
end