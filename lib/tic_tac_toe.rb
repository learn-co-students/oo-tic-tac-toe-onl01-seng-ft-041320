require 'pry'
class TicTacToe
    attr_accessor :board


    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
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

      def input_to_index(input)
        input = input.to_i - 1
        input
      end

      def move(index,token ="X")
        @board[index] = token
      end
      
      def position_taken? (index)
        @board[index] == " " || @board[index] == nil ? false : true
        end

      def valid_move?(index)
         index.between?(0,8) && (position_taken?(index) == false)
      end

      def turn
        puts "Where do you want to go, (1-9)?"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index) == true
            move(index, current_player)
            display_board
        else
            turn
        end
    end 

      def turn_count
        count = 0
        @board.each do |check|
            if check != " " && check != nil
                count += 1
            end
        end
        count
      end

      def current_player
        turn_count.even? ? "X" : "O"
      end


      def full? 
        @board.all? {|check| check != " "}
      end

      def draw? 
        full? && !won? 
      end

      def over?
        full? || won? || draw?
      end


      def winner
        won? ? @board[won?[0]] : nil
      end

      def won?
        WIN_COMBINATIONS.detect do |row|
           
            if position_taken?(row[0]) && @board[row[0]] == @board[row[1]] && @board[row[1]] == @board[row[2]] 
                row
            end 
        end 
    end

      def winner
        won? ? @board[won?[0]] : nil
      end
    
      def play
       turn until over?
         
        if won?
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
        end
      end

end