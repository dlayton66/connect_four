require './lib/game'

class Menu
  def initialize
    loop do
      greeting
      input = main_menu
      break if input == "q"
      
      @game = Game.new
      @game.new_board.generate_board(7)
      @game.print_board

      turn_menu

      end_input = end_menu
      break if end_input == "q"
    end
  end

  def greeting
    puts "Welcome to CONNECT FOUR"
    puts "Enter p to play. Enter q to quit."
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

  def turn_menu
    loop do
      puts "Please enter a letter from A-G to select a valid column."
      col = @game.col_select
      @game.take_player_turn(col)
      @game.print_board
      if @game.new_board.check_win?("X",col)
        puts "VICTORY!!!"
        break
      end
      @game.new_board.update_open(col)
  
      comp_col = @game.take_cpu_turn
      @game.print_board
      if @game.new_board.check_win?("O",comp_col)
        puts "LOSERDOM!!!"
        break
      end
      @game.new_board.update_open(comp_col)
  
      if @game.new_board.tie_game?
        puts "Tie game!"
        break
      end
    end
  end

  def end_menu
    puts "*** GAME OVER ***"
    puts "Enter M to return to main menu or Q to quit"
    loop do
      choice = gets.chomp.downcase
      if choice == 'q'
        return 'q'
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