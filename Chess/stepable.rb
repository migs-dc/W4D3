require_relative 'nullpiece'

module Stepable
  def moves
    res = []
    move_diffs.each do |move|
      current_pos = [ pos[0]+move[0], pos[1]+move[1] ]
      if on_board?(current_pos)
        if board[current_pos].is_a?(NullPiece) || board[current_pos].color != color
          res << current_pos
        end
      end
    end
    res

    # create array to collect moves

    # iterate through each of the piece's possible move_diffs
      # for each move_diff, increment the piece's position to generate a new position
      # add the new position to the moves array if it is:
        # on the board and empty
        # OR on the board and contains a piece of the opposite color

    # return the final array of moves
  end

  def on_board?(current_pos)
    row, col = current_pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end

  

  private

  def move_diffs
    # subclass implements this
    raise NotImplementedError
  end
end


# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!
