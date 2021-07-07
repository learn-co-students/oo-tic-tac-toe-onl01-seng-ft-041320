class TicTacToe

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
   
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

  def input_to_index(player_input)
    player_input = player_input.to_i 
    player_input = player_input - 1
  end

  def move(position, token = X)
    @board[position] = token
  end

  def position_taken?(index)
    @board[index] != " " ? true : false
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn
    puts "Please choose a move between 1-9:"
    user_entry = gets
    index = input_to_index(user_entry)
    valid_move = valid_move?(index)
    if valid_move
        move(index, current_player)
        display_board
    else
        turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end


  def full?
    @board.all?{|i| i != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if combo = won?
        @board[combo[0]]
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




