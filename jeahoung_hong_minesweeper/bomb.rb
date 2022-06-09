class Bomb

    attr_reader :active, :revealed, :flagged

    def self.random_factory(num_bombs, num_grid)
        return false if num_bombs > num_grid

        arr = []
        num_bombs.times do
            arr << Bomb.new(true)
        end
        (num_grid - num_bombs).times do 
            arr << Bomb.new(false)
        end

        return arr.shuffle

    end

    def initialize(active)

        @active = active
        @revealed = false
        @flagged = false

    end

    def to_s
        return "F" if @flagged
        return "⬜" if !@revealed
        return @active ? "*" : "_"
    end

    def flag
        @flagged = @flagged ? false : true
    end

end