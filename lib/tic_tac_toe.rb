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
    @board[index] == " " ? true : false
  end

  def turn
    # allow($stdout).to receive(:puts)
    # expect(game).to receive(:gets).and_return("5")
    # expect(game).to receive(:input_to_index).and_return(4)
    # expect(game).to receive(:valid_move?).and_return(true)
    # expect(game).to receive(:current_player).and_return("X")
    #
    # game.turn
  # Ask the user for their move by specifying a position between 1-9.
    puts "It is your turn.  Please choose a number between 1 to 9:  "
    input = gets.strip
  # Receive the user's input.
  # Translate that input into an index value.
    index = input_to_index(input)
    cp = current_player
  # If the move is valid, make the move and display the board.
  if (valid_move?(index))
    move(index, cp)
    display_board
  else
    puts "That was invalid, try again"
    display_board
    # input = gets.strip
    turn
  end

    # binding.pry

    # while (valid_move?(index) == false)
    #   puts "Move is invalid!! Please try again: "
    #   input = gets
    #   index = input_to_index(input)
    #   index
    # end
    # move(index, current_player)
    # display_board
    # binding.pry

  # If the move is invalid, ask for a new move until a valid move is received.
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

end
# game = TicTacToe.new
# game.turn
