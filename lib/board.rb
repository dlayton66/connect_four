class Board
  attr_accessor :grid, :open_row, :open_col
  
  def initialize
    @grid = {
      row_0: "ABCDEFG",
      row_1: ".......",
      row_2: ".......",
      row_3: ".......",
      row_4: ".......",
      row_5: ".......",
      row_6: ".......",
      }
    @open_row = [6,6,6,6,6,6,6]
    @open_col = [0,1,2,3,4,5,6]
  end

  def game_over?
    @open_col == [] # || four of a kind win con check goes here
  end

  def update_open(col)
    open_row[col] -= 1
    open_col.delete(col) if open_row[col] == 0
  end

  def check_win?(piece, col)
    row = open_row[col] + 1
  end
end