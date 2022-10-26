require './lib/board'

class Game
  attr_reader :new_board

  def initialize
    @new_board = Board.new
  end

  def print_board
    7.times { |num| puts @new_board.grid["row_#{num}".to_sym].row }
  end

  def col_select
    loop do
      input = gets.chomp
      col = convert_input(input)

      if ["a", "b", "c", "d", "e", "f", "g"].include?(input.downcase) && @new_board.open_col.include?(col)
        return col
      elsif ["a", "b", "c", "d", "e", "f", "g"].include? input.downcase 
        puts "That column is full.  Please select another."
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

  def take_player_turn(col)
    @new_board.update_board("X", col)
  end

  def take_cpu_turn
    comp_col = @new_board.open_col.sample
    @new_board.update_board("O", comp_col)
    return comp_col
  end

  def row_sym(num)
    "row_#{num}".to_sym
  end
end