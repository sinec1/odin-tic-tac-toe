class Player
  attr_reader :name, :letter, :score
  def initialize(name,letter,num)
    @name = name
    @letter = letter
    @num = num
  end

  def update_score()
    score += 1
  end
end