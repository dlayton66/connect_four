require './lib/board'

class Game
  attr_reader :new_board

  def start
    @new_board = Board.new
    puts "Welcome to Connect Four!"
  end

  def initialize
    @new_board = nil
    start
  end
end