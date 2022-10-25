require './lib/row'

class Board
  attr_reader :grid, :open_row, :open_col
  
  def initialize(grid: {
    row_0: "ABCDEFG",
    row_1: ".......",
    row_2: ".......",
    row_3: ".......",
    row_4: ".......",
    row_5: ".......",
    row_6: ".......",
    }, 
    open_row: [6,6,6,6,6,6,6],
    open_col: [0,1,2,3,4,5,6])
    @grid = grid
    @open_row = open_row
    @open_col = open_col
  end

  # def initialize(row_size)
  #   @grid = {} 
  #   @open_row = []
  #   @open_col = []

  #   7.times do |time|
  #     new_row = Row.new(row_size)
  #     if time == 0
  #       new_row.set_row_0(row_size)
  #     end
  #     grid[row_sym(time)] = new_row.row
  #   end
  #   row_size.times do |time|
  #     @open_row << 6
  #     @open_col << time
  #   end
  # end

  def tie_game?
    @open_col == []
  end

  def update_open(col)
    open_row[col] -= 1
    open_col.delete(col) if open_row[col] == 0
  end
  
  def check_horizontal_win?(piece, col)
    row = open_row[col]
    consecutive = 1
    check_row = row
    check_col = col + 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_col += 1
      check_piece = get_piece(check_row,check_col)
    end

    check_col = col - 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_col -= 1
      check_piece = get_piece(check_row,check_col)
    end
  end

  def check_vertical_win?(piece, col)
    row = open_row[col]
    consecutive = 1
    check_row = row + 1
    check_col = col
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row += 1
      check_piece = get_piece(check_row,check_col)
    end
  end

  def check_forward_diag_win?(piece, col)
    row = open_row[col]
    consecutive = 1
    check_row = row - 1
    check_col = col + 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row -= 1
      check_col += 1
      check_piece = get_piece(check_row,check_col)
    end

    check_row = row + 1
    check_col = col - 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row += 1
      check_col -= 1

      check_piece = get_piece(check_row,check_col)
    end
  end

  def check_reverse_diag_win?(piece, col)
    row = open_row[col]
    consecutive = 1
    check_row = row - 1
    check_col = col - 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row -= 1
      check_col -= 1
      check_piece = get_piece(check_row,check_col)
    end

    check_row = row + 1
    check_col = col + 1
    check_piece = get_piece(check_row,check_col)

    while piece == check_piece do
      consecutive += 1
      return true if consecutive == 4

      check_row += 1
      check_col += 1
      check_piece = get_piece(check_row,check_col)
    end
  end

  def check_win?(piece, col)
    return true if check_horizontal_win?(piece, col)
    return true if check_vertical_win?(piece, col)
    return true if check_forward_diag_win?(piece, col)
    return true if check_reverse_diag_win?(piece, col)
    return false
  end

  def row_sym(num)
    "row_#{num}".to_sym
  end

  def update_board(piece, col) 
    row = open_row[col]
    @grid[row_sym(row)][col] = piece
  end

  def get_piece(row,col)
    if in_bounds?(row,col)
      grid[row_sym(row)][col]
    else
      ""
    end
  end

  def in_bounds?(row,col)
    if row < 1
      false
    elsif row > 6
      false
    elsif col < 0
      false
    elsif col > 6
      false
    else
      true
    end
  end
end