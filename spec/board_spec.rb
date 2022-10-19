require 'rspec'
require './lib/board'

describe Board do
	describe '#initialize' do
		before(:each) do
			@board = Board.new
		end

		it 'is an instance of board' do
			expect(@board).to be_a Board
		end

		it 'stores the board' do
			expect(@board.board).to eq({
				row_0: "ABCDEFG",
				row_1: ".......",
				row_2: ".......",
				row_3: ".......",
				row_4: ".......",
				row_5: ".......",
				row_6: ".......",
				})
		end
	end
end