class Board
  attr_accessor :board, :open_row, :playable_col
  
  def initialize
    @board = {
      row_0: "ABCDEFG",
      row_1: ".......",
      row_2: ".......",
      row_3: ".......",
      row_4: ".......",
      row_5: ".......",
      row_6: ".......",
      }
    @open_row = [6,6,6,6,6,6,6]
    @playable_col = [1,2,3,4,5,6,7]
  end
end