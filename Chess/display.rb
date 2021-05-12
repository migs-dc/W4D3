require "colorize"
require_relative "board"
require_relative "cursor"

class Display

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
        print " #{@board.rows}"
      end
      puts
    end
  end

end

