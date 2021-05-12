require_relative "piece"

class Pawn < Piece

    def initialize(symbol)
        @symbol = symbol 
        super(color, board, pos)
    end 

    def moves 
        res = []
        
        if color == :W 
            attack_move = [ [-1, -1], [-1, 1] ]
            current_pos = [ pos[0]-1, pos[1] ] 
        else
            attack_move [ [1, -1], [1, 1] ]
            current_pos = [ pos[0]+1, pos[1] ]
        end

        if board[current_pos].is_a?(NullPiece) && on_board?(current_pos)
            res << current_pos
        end
        
        attack_move.each do |spot|
            if board[spot].color != color && on_board?(spot) 
                res << spot
            end
        end
       
    end

    def on_board?(current_pos)
        row, col = current_pos
        row >= 0 && row <= 7 && col >= 0 && col <= 7
    end


end