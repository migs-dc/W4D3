require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    print " " 
    (0..7).each { |i| print " #{i}" }
    puts

    (0..7).each do |row|
      print "#{row}" 
      (0..7).each do |col|
        pos = [row, col]
        if @cursor.cursor_pos == pos
          print " #{@board[pos].symbol}".colorize(:red)
        else
          pos = [row, col]
          print " #{@board[pos].symbol}".colorize(:blue)
        end
      end
      puts
    end
  end

end

d = Display.new
d.render
k = Knight.new(:B, d.board, [0,1])