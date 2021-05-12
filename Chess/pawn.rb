require_relative "piece"

class Pawn < Piece

    def symbol
        # '♝'.colorize(color)
    end

    def moves 
        res = []
        
        if color == :W 
            current_pos = [ pos[0]-1, pos[1] ] 
            attack_move = [ [-1, -1], [-1, 1] ]
        else
            current_pos = [ pos[0]+1, pos[1] ]
            attack_move = [ [1, -1], [1, 1] ]
        end

        if board[current_pos].is_a?(NullPiece) && on_board?(current_pos)
            res << current_pos
        end

        attack_move.each do |i|
            spot = [ pos[0]+i[0], pos[1]+i[1] ]
            if !board[spot].is_a?(NullPiece)
                if board[spot].color != color && on_board?(spot) 
                    res << spot
                end
            end
        end
       
        res
    end

    def on_board?(current_pos)
        row, col = current_pos
        row >= 0 && row <= 7 && col >= 0 && col <= 7
    end


end