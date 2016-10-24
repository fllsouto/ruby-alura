require "spec_helper"
require "game"

describe Game, "in the final phase" do

  # 1 - Extracting the commom part (DRY)
  before(:each) do
    # Setup
    @game = Game.new #It needs to be a instance variable to share a variable between a hook and its tests
    @game.phase = :final
  end

  context "when the player hits the target" do
    # Could work but in this case is better to do this step in both cases, the test must be clear to the user, and each step on it
    # before { @game.player_hits_target }

    it "congratulates the player" do
      # Part 1
      # game = Game.new
      # game.phase = :final

      # exercise
      @game.player_hits_target

      # verify
      expect(@game.output).to eq("Congratulations!")
    end

    it "sets the score to 100" do
      # Part 1
      # game = Game.new
      # game.phase = :final

      # exercise
      @game.player_hits_target

      # verify
      expect(@game.score).to eq(100)      
    end
  end
end