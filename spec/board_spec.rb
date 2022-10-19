require 'rspec'
require './lib/board'

describe Board do
	describe '#initialize' do
		it 'is an instance of board' do
			board = Board.new
			expect(board).to be_a Board
		end
	end
end