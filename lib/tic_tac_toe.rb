require "pry"

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end

  def turn
    puts "Pick a location from 1-9"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each { |i| count += 1 if i == "X" || i == "O" }
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |c|
      first_token = @board[c[0]]
      c.each_with_index do |l, i|
        @board[l] != first_token || @board[l] == " " ? break : first_token = @board[l]
        return c if i == c.length - 1
      end
    end
    false
  end

  def full?
    turn_count == 9
  end

  def draw?
    won? == false && full? == true
  end

  def over?
    won? || full?
  end

  def winner
    current_player == "X" ? "O" : "X" if won?
  end

  def play
    until over?
      turn
      break if draw?
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
