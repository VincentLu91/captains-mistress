#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'
require 'player'

def fresh_game
  Game.new(Player.new, Player.new)
end

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe Game, "#winner?" do

  context "fresh_game" do
    it "indicates no winner" do
      expect(fresh_game.winner?).to eql(false)
    end

    it "rack prints 7 rows" do
      rack = fresh_game.rack
      expect(rack.length).to eql(7)
    end

    it "rack prints 6 cols" do
      rack = fresh_game.rack
      expect(rack.all? { |col|  col.length == 6 } ).to be(true)
    end

    it "returns an empty rack" do
      expect(fresh_game.rack).to eql(["------", "------", "------", "------", "------", "------", "------"])
    end
  end
  
  # more tests go here
end
