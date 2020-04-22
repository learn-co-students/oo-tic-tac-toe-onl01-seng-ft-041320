require 'pry'

class TicTacToe
  attr_reader :board
  def initialize(board = Array.new(9, " "))
    @board = board
  end 
  
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
  
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    integer = string.to_i - 1
    integer
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end 
  
  def valid_move?(index)
   index.between?(0,8) && (!position_taken?(index))
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end 
  
  
  def turn
    puts "Please enter 1 - 9"
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end 
  
  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1 
      end
    end 
    turns
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |win|
      index1 = win[0]
      index2 = win[1]
      index3 = win[2]
       if @board[index1] == @board[index2] && @board[index2] == @board[index3] && position_taken?(index1)
         
         win
       end 
    end 
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
  full? && !won?
  end 
  
  def over?
    won? || draw? || full?
  end 
  def winner
    if won?
      @board[won?[0]]
    else
      won?
    end 
  end 
  def play 
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end 
end 