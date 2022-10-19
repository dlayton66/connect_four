require './lib/board'

class Game
  attr_reader :new_board

  def initialize
    @new_board = nil
    start
  end

  def start
    @new_board = Board.new
    puts "Welcome to Connect Four!"
    print_board(@new_board)
    take_turn
  end

  def print_board(board)
    7.times { |num| puts board.board["row_#{num - 1}".to_sym] }
  end

  def row_select
    loop do
      input = gets.chomp
      if ["a", "b", "c", "d", "e", "f", "g"].include? input.downcase 
        return input
      else
        puts "Invalid input. Please enter a letter from A - G"
      end
    end
  end

  def take_turn
    puts "Please enter a letter from A-G to select a column."
    row_select
  end
  
end