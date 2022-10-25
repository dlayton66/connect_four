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
    it 'places players piece at bottom of column B' do
      new_game = Game.new
      new_game.new_board.generate_board(7)
      new_game.take_player_turn(1)
      expect(new_game.new_board.grid[:row_6].row[1]).to eq("X")
    end
  end

  describe '#take_cpu_turn' do
    it 'places a piece for computer' do
      new_game = Game.new
      new_game.new_board.generate_board(7)
      new_game.take_player_turn(1)
      new_game.take_cpu_turn
      grid_output = {}
      new_game.new_board.grid.each do |row|
        grid_output[row[0]] = row[1].row
      end
      expect(grid_output).not_to eq(
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
      new_game = Game.new
      new_game.new_board.generate_board(7)
      6.times { new_game.new_board.update_open(0) }
      6.times { new_game.new_board.update_open(2) }
      6.times { new_game.new_board.update_open(3) }
      6.times { new_game.new_board.update_open(4) }
      6.times { new_game.new_board.update_open(5) }
      6.times { new_game.new_board.update_open(6) }
      new_game.take_cpu_turn
      grid_output = {}
      new_game.new_board.grid.each do |row|
        grid_output[row[0]] = row[1].row
      end

      expect(grid_output).to eq({
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