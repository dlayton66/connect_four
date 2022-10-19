require 'rspec'
require './lib/game'
require './lib/board'

describe Game do
  describe '#initialize' do
    before(:each) do
      @new_game = Game.new
    end

    it 'is an instance of Game' do
      expect(@new_game).to be_a Game
    end
  end

  describe '#start' do
    before(:each) do
      @new_game = Game.new
    end

    it 'creates a board' do
      expect(@new_game.new_board).to be_a Board
    end
  end
end