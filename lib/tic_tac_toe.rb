require "pry"
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = Array.new(9, " ")
    # @board[1] = "X"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    index = -1
    index = number.to_i - 1
    index
  end

  def move(index, player_token="X")
      @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    # @board[index] == " " ? true : false
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "It is your turn.  Please choose a number between 1 to 9:  "
    input = gets.strip
    index = input_to_index(input)
    cp = current_player
    if (valid_move?(index))
      move(index, cp)
      display_board
    else
      puts "That was invalid, try again"
      display_board
      # input = gets.strip
      turn
    end
  end

  def turn_count
    count = 0
    count = @board.count{|player_turn| player_turn==" "}
    count = 9 - count
  end

  def current_player
    current = ""
    #if turn is an even number then its X's turn.  If its odd then its y's turn
    turn_count.even? ? current = "X" : current = "O"
  end

  def won?
    #Steps:
    #1. Flatten the WIN_COMBINATIONS array of arrays into
    WIN_COMBINATIONS.detect do|winner|
      if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
        true
      elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
        true
      else
        nil
      end
    end
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  def draw?
    full? && !(won?) ? true : false
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      WIN_COMBINATIONS.detect do|winner|
          if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
            true
            return "X"
          elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
            true
            return "O"
          else
            nil
          end
        end
    else
      nil
    end
  end

  def play
    # while !(over?)
    #   turn
    #   if won?
    #   elsif draw?
    #     puts "Cat's Game!"
    #   else

      # end
    # end
    until over?
      turn
      if draw?
        puts "Cat's Game!"
      end
    end

    if won?
      winning_letter = ""
      winning_letter = winner
      puts "Congratulations #{winning_letter}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
    # binding.pry
# until the game is over
#   take turns
# end
#
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it ended in a draw
# end
  end
end
# game = TicTacToe.new
# game.play
