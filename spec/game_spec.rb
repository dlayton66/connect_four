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

    it 'removes that grid coordinate from playable' do
      @new_game.take_turn(1)

      expect(@new_game.new_board.open_row[1]).to be < 6
    end

    it 'removes column from playable columns when full' do
      @new_game.new_board.open_row[1] = 1
      @new_game.take_turn(1)

      expect(@new_game.new_board.playable_col).to eq([0,2,3,4,5,6])
    end

    it 'places a piece for computer' do
      @new_game.take_turn(1)

      expect(@new_game.new_board.board).not_to eq(
        {
          row_0: "ABCDEFG",
          row_1: ".......",
          row_2: ".......",
          row_3: ".......",
          row_4: ".......",
          row_5: ".......",
          row_6: ".......",
          } || {
          row_0: "ABCDEFG",
          row_1: ".......",
          row_2: ".......",
          row_3: ".......",
          row_4: ".......",
          row_5: ".......",
          row_6: ".X.....",
          })
    end

    it 'places a piece for computer only in playable column' do
      @new_game.new_board.playable_col = [1]
      @new_game.take_turn(1)
      @new_game.take_turn(1)

      expect(@new_game.new_board.board).to eq({
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".O.....",
        row_4: ".X.....",
        row_5: ".O.....",
        row_6: ".X.....",
        })
    end
  end
end