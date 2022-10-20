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

		it 'stores an array of playable columns' do
			expect(@new_board.playable_col).to eq [0,1,2,3,4,5,6]
		end
	end

	describe '#game_over?' do
		before(:each) do
			@new_board = Board.new
		end

		it 'checks for tied game state' do
			
			expect(@new_board.game_over?).to be false
			
			@new_board.playable_col = []

			expect(@new_board.game_over?).to be true
		end
	end
end