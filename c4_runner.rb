require './lib/board'
require './lib/game'

game = Game.new
puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit."
game.start
game.print_board
puts "Please enter a letter from A-G to select a column."

loop do
  game.take_turn(game.col_select)
  game.print_board
  break if game.new_board.game_over?
end