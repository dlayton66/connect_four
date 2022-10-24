require 'rspec'
require './lib/board'

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

	describe '#tie_game?' do
		before(:each) do
			@new_board = Board.new(open_col: [])
		end

		it 'checks that board is not tied' do
			@new_board = Board.new

			expect(@new_board.tie_game?).to be false
		end

    it 'checks that board is tied' do
			@new_board = Board.new(open_col: [])

			expect(@new_board.tie_game?).to be true
		end
	end

	describe '#update_open' do
		before(:each) do
			@new_board = Board.new
		end

		it 'updates open_row' do
			expect(@new_board.respond_to?(:update_open)).to be true
			@new_board.update_open(1)
			expect(@new_board.open_row).to eq([6,5,6,6,6,6,6])
		end
	end

	describe '#row_sym' do
		it 'converts a row index into a hash symbol' do
			@new_board = Board.new

			expect(@new_board.row_sym(3)).to eq :row_3
		end
	end

	describe '#check_win?' do

    it 'returns false if there is no player win' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".......",
        row_5: ".OXO...",
        row_6: ".XOXX..",
        },
        open_col: [6,4,4,4,6,6,6])

        expect(new_board.check_win?("X",4)).to be false
    end

		it 'returns false if there is no cpu win' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "X...XOX",
        row_4: "OXOXOXO",
        row_5: "OXOXOOO",
        row_6: "XOXOXOX",
        },
        open_row: [2,3,3,3,2,3,2])

        expect(new_board.check_win?("O",5)).to be false
    end

    it 'returns true if player gets a horizontal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".......",
        row_5: "...O...",
        row_6: ".OOXXXX",	
        },
        open_row: [6,5,5,4,6,5,5])
    
        expect(new_board.check_win?("X",4)).to be true
    end

    it 'returns true if player gets a vertical row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".....X.",
        row_4: ".....X.",
        row_5: "....OX.",
        row_6: "...OOX.",
        }, open_row: [6,6,6,5,4,3,6])

        expect(new_board.check_win?("X",5)).to be true
    end

    it 'returns true if player gets a forward diagonal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "....X..",
        row_4: "...XO..",
        row_5: "..XOX..",
        row_6: ".XOXO..",
        },
        open_row: [6,5,4,3,3,6,6])
    
      expect(new_board.check_win?("X",4)).to be true
    end

    it 'returns true if player gets a backward diagonal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "..X....",
        row_4: "..OX...",
        row_5: "..XOX..",
        row_6: "..OXOX.",
        },
        open_row: [6,6,3,3,4,5,6])

      expect(new_board.check_win?("X",2)).to be true
    end

		it 'returns true if computer gets a horizontal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".X.....",
        row_5: ".XXX...",
        row_6: ".OOOO..",
        },
        open_row: [6,3,4,4,6,6,6])

        expect(new_board.check_win?("O",4)).to be true
    end

    it 'returns true if computer gets a vertical row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".....O.",
        row_4: ".....O.",
        row_5: "....XO.",
        row_6: "..XXXO.",
        },
        open_row: [6,6,5,5,4,3,6])
      
        expect(new_board.check_win?("O",5)).to be true
    end

    it 'returns true if computer gets a forward diagonal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "....O..",
        row_4: "...OX..",
        row_5: "..OXO..",
        row_6: ".OXOXX.",
        },
        open_row: [6,5,4,3,3,5,6])

      expect(new_board.check_win?("O",4)).to be true
    end

    it 'returns true if computer gets a backward diagonal row of 4' do
      new_board = Board.new(grid: {
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: "..O....",
        row_4: "..XO...",
        row_5: "..OXO..",
        row_6: ".XXOXO.",
        },
        open_row: [6,5,3,3,4,5,6])

      expect(new_board.check_win?("O",2)).to be true
    end
  end

  describe '#update_open' do
    before(:each) do
      @new_board = Board.new
    end

    it 'removes that grid coordinate from playable' do 
      @new_board.update_open(1)

      expect(@new_board.open_row[1]).to be < 6
    end

    it 'removes column from playable columns when full' do 
      6.times do
        @new_board.update_open(1)
      end

      expect(@new_board.open_col).to eq([0,2,3,4,5,6])
    end
  end

  describe '#update_board' do
    it 'changes the state of the board' do
      new_board = Board.new

      expect(new_board.respond_to?(:update_board)).to be true
      new_board.update_board("X", 0)
      expect(new_board.grid).to eq({
        row_0: "ABCDEFG",
        row_1: ".......",
        row_2: ".......",
        row_3: ".......",
        row_4: ".......",
        row_5: ".......",
        row_6: "X......",
        })
    end
  end
end