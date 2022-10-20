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

  describe '#convert_input' do
    before(:each) do
      @new_game = Game.new
    end

    it 'converts inputted string into defined integer' do
      expect(@new_game.convert_input("A")).to eq(0)
      expect(@new_game.convert_input("B")).to eq(1)
      expect(@new_game.convert_input("C")).to eq(2)
      expect(@new_game.convert_input("D")).to eq(3)
      expect(@new_game.convert_input("E")).to eq(4)
      expect(@new_game.convert_input("F")).to eq(5)
      expect(@new_game.convert_input("G")).to eq(6)
    end
  end
  
  describe '#take_turn' do
    before(:each) do
      @new_game = Game.new
    end

    it 'places players piece at bottom of column B' do
      @new_game.take_turn(1)

      expect(@new_game.new_board.board[:row_6][1]).to eq("X")
    end

    it 'makes that grid coordinate as unplayable' do
      @new_game.take_turn(1)

      expect(@new_game.new_board.open_row[1]).to be < 6
    end
  end
end