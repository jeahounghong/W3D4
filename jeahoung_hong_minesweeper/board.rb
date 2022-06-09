require_relative 'bomb.rb'

class Board

    attr_reader :grid

    def [](pos)
        return @grid[pos[0]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def initialize(size)
        @grid = Array.new(size){Array.new(size)}
        @dim = size
        @size = size * size
        @num_bombs = @size/4
        layout = Bomb.random_factory(@num_bombs,@size)
        
        @grid.each_with_index do |row,i|
            row.each_with_index do |el,j|
                @grid[i][j] = layout.shift
            end
        end
    end

    def display_grid
        puts
        puts "Number of bombs: #{@num_bombs}"
        puts
        @grid.each do |row|
            puts row.join("")
            # puts
        end
        puts
    end

    def try(pos)
        

    end

    def adjacent_bombs(pos)
        rows = [pos[0]-1, pos[0], pos[0]+1]
        cols = [pos[1]-1, pos[1], pos[1] + 1]
        potential_positions = []
        rows.each do |row|
            cols.each do |col|
                if !(row  == pos[0] && col == pos[1])
                    if row >= 0 && col >= 0
                        if row < @dim && col < @dim
                            potential_positions << [row,col] 
                        end
                    end
                end
            end
        end
        count = 0
        potential_positions.each do |pos|
            count += 1 if self[pos].active 
        end
        # if (1...@dim-1).include?(pos[0]) && (1...@dim-1).include?(pos[1])

        # end
        return count
    end

    def game_over?
        @grid.each do |row|
            row.each do |el|
                return true if el.revealed && el.active
            end
        end
        false
    end

end

# b = Board.new(9)
# b.display_grid
# puts b.adjacent_bombs([8,8])