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
    row = open_row[col]

    # horizontal win
    consecutive = 1
    check_row = row
    check_col = col + 1
    check_piece = grid[row_sym(check_row)][check_col]

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_col += 1
      check_piece = grid[row_sym(check_row)][check_col]
    end

    check_col = col - 1
    check_piece = grid[row_sym(check_row)][check_col]

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_col -= 1
      check_piece = grid[row_sym(check_row)][check_col]
    end

    # vertical win
    consecutive = 1
    check_row = row + 1
    check_col = col
    if check_row < 7
      check_piece = grid[row_sym(check_row)][check_col]
    else
      check_piece = ""
    end

    while piece == check_piece && check_row < 7 do
      consecutive += 1
      return true if consecutive == 4

      check_row += 1
      check_piece = grid[row_sym(check_row)][check_col]
    end

    # forward diagonal win
    consecutive = 1
    check_row = row - 1
    check_col = col + 1

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row -= 1
      check_col += 1
      check_piece = grid[row_sym(check_row)][check_col]
    end

    check_row = row + 1
    check_col = col - 1
    if check_row < 7
      check_piece = grid[row_sym(check_row)][check_col]
    else
      check_piece = ""
    end

    while piece == check_piece && check_row < 7 do
      consecutive += 1
      return true if consecutive == 4

      check_row += 1
      check_col -= 1
      check_piece = grid[row_sym(check_row)][check_col]
    end

    # backward diagonal win
    return false
  end

  def row_sym(num)
    "row_#{num}".to_sym
  end
end