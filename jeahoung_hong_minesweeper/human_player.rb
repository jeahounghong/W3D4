class HumanPlayer

    def initialize(name)
        @name = name
    end

    def get_move
        puts
        puts "1,2,T is interpretted as 'Try 1,2"
        puts "3,4,F is interpretted as 'Flag 3,4"
        puts
        puts "Please enter a move:"
        answer = gets.chomp
        answer = answer.split(",")
        return false if answer.length != 3
        return [answer[0].to_i, answer[1].to_i, answer[2]]
    end

end