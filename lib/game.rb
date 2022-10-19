require './lib/board'

class Game
  attr_reader :new_board

  def start
    @new_board = Board.new
    puts "Welcome to Connect Four!"
    print_board(@new_board)
  end

  def print_board(board)
    7.times { |num| puts board.board["row_#{num - 1}".to_sym] }
  end

  def initialize
    @new_board = nil
    start
  end
end