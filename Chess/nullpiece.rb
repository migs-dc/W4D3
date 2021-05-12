require_relative "piece"
require 'singleton'


class NullPiece < Piece

  attr_reader :color

  include Singleton 

  def initialize #(color, board, pos)  
    #super(color, board, pos)  
    @color = :-
  end

  def symbol
    # ''.colorize(color)
  end



end 