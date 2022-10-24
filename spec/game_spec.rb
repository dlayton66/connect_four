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
  
  describe '#take_player_turn' do
    before(:each) do
      @new_game = Game.new
    end

    it 'places players piece at bottom of column B' do
      @new_game.take_player_turn(1)

      expect(@new_game.new_board.grid[:row_6][1]).to eq("X")
    end

    xit 'removes that grid coordinate from playable' do # move tests to board_spec
      @new_game.take_player_turn(1)

      expect(@new_game.new_board.open_row[1]).to be < 6
    end

    xit 'removes column from playable columns when full' do # move tests to board_spec
      @new_game.new_board.open_row[1] = 1
      @new_game.take_player_turn(1)

      expect(@new_game.new_board.open_col).to eq([0,2,3,4,5,6])
    end
  end

  describe '#take_cpu_turn' do
    before(:each) do
      @new_game = Game.new
    end

    it 'places a piece for computer' do
      @new_game.take_player_turn(1)
      @new_game.take_cpu_turn

      expect(@new_game.new_board.grid).not_to eq(
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
      @new_game.new_board.open_col = [1]
      @new_game.take_cpu_turn

      expect(@new_game.new_board.grid).to eq({
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".......",
        row_5: ".......",
        row_6: ".O.....",
        })
    end
  end
end