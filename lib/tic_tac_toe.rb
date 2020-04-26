require "pry"

class TicTacToe    
    def initialize
        @board = Array.new(9, " ")
        # @board=["X", "X", "X", " ", " ", " ", " ", " ", " "] 
    end
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        index_pos = (user_input.to_i)-1
        index_pos
    end

    def move(index, player = "X")
        @board[index] = player
    end

    def position_taken?(index)
        (@board[index] == " ") ? false : true
    end

    def valid_move?(index)
        (!(self.position_taken?(index)) && (index.between?(0,8)))
    end
    
    def turn
        player_selection = gets
        index = self.input_to_index(player_selection)
        while (self.valid_move?(index) == false)
            puts "Please enter a valid move."
            player_selection = gets
            index = self.input_to_index(player_selection)
        end
        player = self.current_player
        self.move(index, player)
        self.display_board
    end
    
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end
    
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def won?
        if (WIN_COMBINATIONS.any? { |combination| combination.all? { |pos| @board[pos] == "X"}})
            WIN_COMBINATIONS.find { |combination| combination.all? { |pos| @board[pos] == "X"}}
        elsif (WIN_COMBINATIONS.any? { |combination| combination.all? { |pos| @board[pos] == "O"}})
            WIN_COMBINATIONS.find { |combination| combination.all? { |pos| @board[pos] == "O"}}
        else
            false
        end
    end

    def full?
        (self.turn_count < 9) ? false : true
    end

    def draw?
        (self.full? && !(self.won?))
    end

    def over?
        (self.draw? || self.won?)
    end

    def winner
        if (self.won?)
            if (WIN_COMBINATIONS.any? { |combination| combination.all? { |pos| @board[pos] == "X"}})
                "X"
            elsif (WIN_COMBINATIONS.any? { |combination| combination.all? { |pos| @board[pos] == "O"}})
                "O"
            end
        end
    end

    def play
        # until the game is over
        #     take turns
        #   end
        while (!(self.over?))
            self.turn
        end
           
        #   if the game was won
        #     congratulate the winner
        #   else if the game was a draw
        #     tell the players it ended in a draw
        #   end
        if (self.winner == "X")
            puts "Congratulations X!"
        elsif (self.winner == "O")
            puts "Congratulations O!"
        elsif (draw?)
            puts "Cat's Game!"
        else
            puts "Error?"
        end
    end
end

# binding.pry
# 0