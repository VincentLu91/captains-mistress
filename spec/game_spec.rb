#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'
require 'player'

# Note that this method returns a fresh instance every time it is called
# which can be a bit deceptive within a single test case
def fresh_game
  Game.new(Player.new, Player.new)
end

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe Game do

  context "fresh_game" do
    it "indicates no winner" do
      expect(fresh_game.winner?).to eql(false)
    end
  end

  describe "#rack" do
    # use the same subject (Game) within a test
    subject { fresh_game }

    it "rack prints 7 rows" do
      expect(subject.rack.length).to eql(7)
    end

    it "rack prints 6 cols" do
      expect(subject.rack.all? { |col| col.length == 6 } ).to be(true)
    end

    context "with a new game" do
      let (:printed_empty_rack) do
        [
          "------",
          "------",
          "------",
          "------",
          "------",
          "------",
          "------"
        ]
      end

      it "returns an empty rack" do
        expect(subject.rack).to eql printed_empty_rack
      end

      # Note: you should be testing the bevaviour of the object, and its behaviour
      # is exhibited through it's public methods
      # We currently have no way to check the state of a Game since it doesn't
      # have public methods we can use

      # However, since this is Ruby, we can cheat a bit and inspect the object

      # Note that this is a bad test and is "brittle" -- it tests the implementation
      # of the Game class' @rack variable, so will break whenever the
      # implamentation changes

      # A much better approach would be for the Game class to have a method that
      # gives you the state or status of the entire game.
      # You could then easily compare those.

      # You should consider merging in the rest of the group's work as they may
      # have added methods that would make testing this easier

      it "does not alter the game's state" do
        rack_before = subject.send(:instance_variable_get, :"@rack").inspect
        subject.rack
        rack_after  = subject.send(:instance_variable_get, :"@rack").inspect

        expect(rack_after).to eql rack_before
      end

      # Note that checking that rack is idempotent does not actually check if
      # @rack is unchanged, since it just checks the formatted output of @rack
      # is the same. Check out this pry session:

      # the rack is initially empty
      # [3] pry(#<Game>):1> @rack
      # => [[], [], [], [], [], [], []]

      # and rack prints empty
      # [4] pry(#<Game>):1> rack
      # => ["------", "------", "------", "------", "------", "------", "------"]

      # @rack now contains all our spacers!
      # [5] pry(#<Game>):1> @rack
      # => [["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"],
      #  ["-", "-", "-", "-", "-", "-"]]

      # but #rack still prints correctly!
      # [6] pry(#<Game>):1> rack
      # => ["------", "------", "------", "------", "------", "------", "------"]

      it "is idempotent" do
        first_call  = subject.rack
        second_call = subject.rack

        expect(first_call).to eql second_call
      end
    end

    context "when the game is in progress" do
      
    end
  end
end
