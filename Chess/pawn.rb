require_relative "piece"

class Pawn < Piece

    def initialize(symbol)
        @symbol = symbol 
        super(color, board, pos)
    end 

    def moves 
        
    end



end