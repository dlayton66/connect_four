require './lib/board'

class Game
  attr_reader :new_board

  def initialize
    @new_board = Board.new
  end

  def start
    loop do
      choice = gets.chomp.downcase
      if choice == 'q'
        exit
      elsif choice == 'p'
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

  def take_turn(col)
    # Player turn
    row = @new_board.open_row[col]
    
    @new_board.grid["row_#{row}".to_sym][col] = "X"
    # check win
    @new_board.update_open(col)

    # Computer turn
    comp_col = @new_board.open_col.sample
    comp_row = @new_board.open_row[comp_col]

    @new_board.grid["row_#{comp_row}".to_sym][comp_col] = "O"
    @new_board.update_open(comp_col)

    if @new_board.open_col == []
      # Check win condition
      puts "Tie game!"
    end
  end
  
end