require './lib/board'

class Game
  attr_reader :new_board

  def initialize
    @new_board = nil
    start
  end

  def start
    @new_board = Board.new 
  end

  def print_board
    7.times { |num| puts @new_board.board["row_#{num}".to_sym] }
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

  def convert_input(input)
    if input.downcase == "a"
      return 0
    elsif input.downcase == "b"
      return 1
    elsif input.downcase == "c"
      return 2
    elsif input.downcase == "d"
      return 3
    elsif input.downcase == "e"
      return 4
    elsif input.downcase == "f"
      return 5
    elsif input.downcase == "g"
      return 6
    end
  end

  def take_turn
    row = convert_input(row_select)
    @new_board.board[:row_6][row] = "X"
  end
  
end