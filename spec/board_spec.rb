require 'rspec'
require './lib/board'
require './lib/game'

describe Board do
	describe '#initialize' do
		before(:each) do
			@new_board = Board.new
		end

		it 'is an instance of board' do
			expect(@new_board).to be_a Board
		end

		it 'stores the board' do
			expect(@new_board.grid).to eq({
				row_0: "ABCDEFG",
				row_1: ".......",
				row_2: ".......",
				row_3: ".......",
				row_4: ".......",
				row_5: ".......",
				row_6: ".......",
				})
		end

		it 'stores an array of lowest open rows' do
			expect(@new_board.open_row).to eq [6,6,6,6,6,6,6]
		end

		it 'stores an array of open columns' do
			expect(@new_board.open_col).to eq [0,1,2,3,4,5,6]
		end
	end

	describe '#game_over?' do
		before(:each) do
			@new_board = Board.new
		end

		it 'checks for tied game state' do
			
			expect(@new_board.game_over?).to be false
			
			@new_board.open_col = []

			expect(@new_board.game_over?).to be true
		end
	end

	describe '#update_open' do
		before(:each) do
			@new_board = Board.new
		end

		it 'updates open_row' do
			# require 'pry'; binding.pry
			expect(@new_board.respond_to?(:update_open)).to be true
			@new_board.update_open(1)
			expect(@new_board.open_row).to eq([6,5,6,6,6,6,6])
		end
	end

	describe '#check_win' do
    before(:each) do
      @new_board = Board.new
    end

    it 'returns win for a horizontal row of 4' do
      @new_board.grid = {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".......",
        row_5: ".OOO...",
        row_6: ".XXXX..",
        }

        expect(@new_board.check_win).to be True
    end

    it 'returns win for a vertical row of 4' do
      @new_board.grid = {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".....X.",
        row_4: ".....X.",
        row_5: "....OX.",
        row_6: "...OOX.",
        }

        expect(@new_board.check_win).to be True
    end

    it 'returns win for a forward diagonal row of 4' do
      @new_board.grid = {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "....X..",
        row_4: "...XO..",
        row_5: "..XOX..",
        row_6: ".XOXO..",
        }

      expect(@new_board.check_win).to be True
    end

    it 'returns win for a backward diagonal row of 4' do
      @new_board.grid = {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "..X....",
        row_4: "..OX...",
        row_5: "..XOX..",
        row_6: "..OXOX.",
        }

      expect(@new_board.check_win).to be True
    end
  end
end