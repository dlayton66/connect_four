require './lib/board'
require './lib/game'

game = Game.new
puts "Welcome to Connect Four!"
game.print_board
puts "Please enter a letter from A-G to select a column."

# Temporary way to make the game repeat
n = 0
while n < 42
  game.take_turn
  game.print_board
  n += 1
end