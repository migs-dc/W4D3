module Slideable

  # HORIZONTAL_DIRS stores an array of horizontal directions
    # when a piece moves in a given direction, its row and/or its column should increment by some value
    # ex: A piece starts at position [1, 2] and it moves horizontally to the right
      # its position changes to [1,3]
      # the row increases by 0 and the column increases by 1
  HORIZONTAL_DIRS = [
    [0, -1], # left
    [0, 1], # right [0, 1]
    [-1, 0], # up (vertical)
    [1, 0]  # down (vertical)
  ].freeze # prevents any mutations to outer array

  # DIAGONAL_DIRS stores an array of diagonal directions
  DIAGONAL_DIRS = [
    [-1, -1], # up + left [-1, -1]
    [-1, 1], # up + right
    [1, -1], # down + left
    [1, 1]  # down + right
  ].freeze


  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end


  # should return an array of places a Piece can move to
  def moves
    res = []
    move_dirs.each do |pos| # [0, 1]
        dx, dy = pos  # 0, 1
        temp = grow_unblocked_moves_in_dir(dx, dy) # 0, 1 => [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6]]
        res += temp 
    end
    res 

    # iterate over each of the directions in which a slideable piece can move
      # use the Piece subclass' `#move_dirs` method to get this info
      # for each direction, collect all possible moves in that direction
        # and add them to your moves array 
        # (use the `grow_unblocked_moves_in_dir` helper method)

    # return the final array of moves (containing all possible moves in all directions)
  end


  private
  def move_dirs
    move = []
    # subclass implements this
    raise NotImplementedError # this only executes if 
  end


  # this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy
  def grow_unblocked_moves_in_dir(dx, dy)
    res = []

    row, col = pos 
    row += dx
    col += dy

    until row < 0 || row > 7 || col < 0 || col > 7
        current_pos = row, col 
        if board[current_pos].is_a?(NullPiece)
            res << current_pos 
        elsif color != board[current_pos].color 
            res << current_pos
            break
        elsif color == board[current_pos].color 
            break
        end
      
      row += dx
      col += dy
    end
    res 

    # get the piece's current row and current column

    # starting pos = [0, 0]
    # dir = [0, 1]
    # [0, 0]
    # [0, 1]
    # [0, 2]
    # ... until we go off board or hit a piece

    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping

    # return the final moves array
  end
  
end




# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!
