class TicTacToe
  attr_reader :board
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(position, token="X")
    @board[position] = token
  end
  
  def position_taken?(position)
    !(@board[position].empty? || @board[position] == " ")
  end
  
  def valid_move?(position)
    if (position >= 0 && position <= 8) && !position_taken?(position)
      return true
    else 
      return false 
    end
  end
  
  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter a number between 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    current_token = current_player
    if valid_move?(index)
      move(index, current_token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
      false
    end
  end
  
  def full?
    !@board.any?{|pos| pos == " "}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play 
    turn until over?
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
  end
end