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

  def col_select
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
    # Player turn
    if @new_board.playable_col == []
      puts "Tie game!"
    else
      col = convert_input(col_select)
      row = @new_board.open_row[col]
      if @new_board.playable_col.include? col
        @new_board.board["row_#{row}".to_sym][col] = "X"
        @new_board.open_row[col] -= 1
        if @new_board.open_row[col] == 0
          @new_board.playable_col.delete(col)
        end
      else
        puts "That column is full.  Please select another."
      end
    end

    # Computer turn
    if @new_board.playable_col == []
      puts "Tie game!"
    else
      comp_col = @new_board.playable_col.sample
      comp_row = @new_board.open_row[comp_col]
      @new_board.board["row_#{comp_row}".to_sym][comp_col] = "O"

      @new_board.open_row[comp_col] -= 1
      if @new_board.open_row[comp_col] == 0
        @new_board.playable_col.delete(comp_col)
      end
    end
  end
  
end