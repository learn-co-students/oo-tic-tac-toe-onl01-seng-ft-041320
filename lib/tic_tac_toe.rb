require "pry"

class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

     WIN_COMBINATIONS = [
         [0,1,2],
         [3,4,5],
         [6,7,8],
         [0,3,6],
         [1,4,7],
         [2,5,8],
         [0,4,8],
         [6,4,2]
     ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        i = string.to_i
        index = i - 1
    end

    def move(index, token = "X")
         @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if position_taken?(index) == false && index.between?(0, 8) == true
            true
        elsif position_taken?(index) == true
            false
        elsif index.between?(0, 8) == false
            false
        end       
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
      end

      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

      def turn
        puts "Please enter 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index) == true && current_player == "X"
                move(index, value = "X")
                puts display_board
        elsif valid_move?(index) == true && current_player == "O"
                move(index, value = "O")
                puts display_board
        elsif valid_move?(index) == false
            puts "Please enter 1-9:"
            input = gets.chomp
        else 
            puts "Please enter 1-9:"
            input = gets.chomp
        end

        def full?
            @board.all? do |index|
                 index == "X" || index == "O"
                end
            end
        end

        def won?
            WIN_COMBINATIONS.detect do |combo|
              position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            end
          end
        
        def draw?
            if won? 
                return false
            elsif full? == false 
                return false 
            else 
                return true
            end
        end
    
        def over?
            if won? || draw? == true
                return true
            else
                return false
            end
        end

        def winner
            winning_combo = won?
             if winning_combo
                return @board[winning_combo[0]]
             end
        end

        def play
            while over? == false
                turn
            end
        
            if draw?
                puts "Cat's Game!"
            elsif winner == "X" 
                puts "Congratulations X!"
            elsif winner == "O"
                puts "Congratulations O!"
            end
        end






















end