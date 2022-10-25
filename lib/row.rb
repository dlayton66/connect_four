class Row
  attr_reader :row

  def initialize(num)
    @row = "." * num
  end

  def set_row_0(num)
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @row = alphabet[0,num]
  end
  # update_row places piece in correct index position
end