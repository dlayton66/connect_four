require './lib/board'

class Game
  attr_reader :new_board

  def initialize
    @new_board = Board.new
  end

  def main_menu
    loop do
      input = gets.chomp.downcase
      if input == 'q'
        return input
        break
      elsif input == 'p'
        return input
        break
      else
        puts "Invalid input."
        puts "Enter p to play. Enter q to quit."
      end
    end
  end

  def print_board
    7.times { |num| puts @new_board.grid["row_#{num}".to_sym] }
  end

  def col_select
    loop do
      input = gets.chomp
      col = convert_input(input)
      if !["a", "b", "c", "d", "e", "f", "g"].include? input.downcase 
        puts "Invalid input. Please enter a letter from A - G"
      elsif !@new_board.open_col.include? col
        puts "That column is full.  Please select another."
      else  
        return col
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
    # Player turn
    row = @new_board.open_row[col]
    @new_board.grid[row_sym(row)][col] = "X"
  end

  def take_cpu_turn
    # Computer turn
    comp_col = @new_board.open_col.sample
    comp_row = @new_board.open_row[comp_col]
    @new_board.grid[row_sym(comp_row)][comp_col] = "O"
    # @new_board.update_board(arguments go here)
    return comp_col
  end

  def row_sym(num)
    "row_#{num}".to_sym
  end

  def end_menu
    puts "*** GAME OVER ***"
    puts "Enter M to return to main menu or Q to quit"
    loop do
      choice = gets.chomp.downcase
      if choice == 'q'
        break
      elsif choice == 'm'
        break
      else
        puts "Invalid input."
        puts "Enter M to return to main menu or Enter Q to quit."
      end
    end
  end
end