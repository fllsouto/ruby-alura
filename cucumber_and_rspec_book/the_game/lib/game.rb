class Game

  attr_accessor :phase, :score

  def initialize
    @score = 0
  end

  def player_hits_target
    @score = 100
  end

  def output
    "Congratulations!"
  end
end