require './lib/board'
require './lib/game'

loop do
  game = Game.new
  game.new_board.generate_board(7)
  puts "Welcome to CONNECT FOUR"
  puts "Enter p to play. Enter q to quit."
  input = game.main_menu
  break if input == "q"
  game.print_board

  loop do
    puts "Please enter a letter from A-G to select a valid column."
    col = game.col_select
    game.take_player_turn(col)
    game.print_board
    if game.new_board.check_win?("X",col)
      puts "VICTORY!!!"
      break
    end
    game.new_board.update_open(col)

    comp_col = game.take_cpu_turn
    game.print_board
    if game.new_board.check_win?("O",comp_col)
      puts "LOSERDOM!!!"
      break
    end
    game.new_board.update_open(comp_col)

    if game.new_board.tie_game?
      puts "Tie game!"
      break
    end
  end

  end_input = game.end_menu
  break if end_input == "q"
end