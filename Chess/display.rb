require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render(cursor_pos)
    
  end 

end

