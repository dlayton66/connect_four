class Row
  attr_reader :row

  def initialize(num)
    @row = "." * num
  end

  def set_row_0(num)
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @row = alphabet[0,num]
  end

  def update_row(piece, col)
    @row[col] = piece
  end
end