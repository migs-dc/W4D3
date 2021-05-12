require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  

  def symbol
    '♛'.colorize(color)
  end

  protected

  def move_dirs
    moves = horizontal_dirs + diagonal_dirs 
  end
end


# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!
