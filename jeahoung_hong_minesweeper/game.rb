require_relative 'board.rb'
require_relative 'human_player.rb'
class Game

    def initialize(num)
        @board = Board.new(num)
        @player = HumanPlayer.new("David")

    end

    def turn
        while !self.game_over? do
            @board.display_grid
            answer = @player.get_move
            @board.try(answer)


            system("clear")
        end
    end


    def game_over?
        return @board.game_over?
    end

end

game = Game.new(9)
game.turn