class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
    @current_player = 'X'
    @winner = nil
    @game_over = false
  end

  def print_board
    system('clear') || system('cls')  # Clear console
    puts "\nTIC TAC TOE"
    puts "-----------"
    3.times do |i|
      puts " #{@board[i*3]} | #{@board[i*3+1]} | #{@board[i*3+2]} "
      puts "-----------" if i < 2
    end
    puts
  end

  def make_move(position)
    if @board[position] == ' ' && !@game_over
      @board[position] = @current_player
      check_winner
      switch_player
      return true
    end
    false
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def check_winner
    # Check rows
    (0..6).step(3) do |i|
      if @board[i] != ' ' && @board[i] == @board[i+1] && @board[i] == @board[i+2]
        @winner = @board[i]
        @game_over = true
        return
      end
    end

    # Check columns
    3.times do |i|
      if @board[i] != ' ' && @board[i] == @board[i+3] && @board[i] == @board[i+6]
        @winner = @board[i]
        @game_over = true
        return
      end
    end

    # Check diagonals
    if @board[0] != ' ' && @board[0] == @board[4] && @board[0] == @board[8]
      @winner = @board[0]
      @game_over = true
      return
    end
    if @board[2] != ' ' && @board[2] == @board[4] && @board[2] == @board[6]
      @winner = @board[2]
      @game_over = true
      return
    end

    # Check for tie
    if !@board.include?(' ')
      @game_over = true
    end
  end

  def get_available_moves
    @board.each_index.select { |i| @board[i] == ' ' }
  end

  def get_player_move
    loop do
      print "Player #{@current_player}, enter position (1-9): "
      position = gets.chomp.to_i - 1
      if position.between?(0, 8) && @board[position] == ' '
        return position
      else
        puts "Invalid move! Choose an empty position (1-9)."
      end
    end
  end

  def get_computer_move
    available_moves = get_available_moves

    # Try to win
    available_moves.each do |move|
      temp_board = @board.dup
      temp_board[move] = 'O'
      if check_winning_move(temp_board, 'O')
        return move
      end
    end

    # Block opponent
    available_moves.each do |move|
      temp_board = @board.dup
      temp_board[move] = 'X'
      if check_winning_move(temp_board, 'X')
        return move
      end
    end

    # Choose center if available
    if available_moves.include?(4)
      return 4
    end

    # Choose corners
    corners = [0, 2, 6, 8]
    available_corners = corners & available_moves
    if !available_corners.empty?
      return available_corners.sample
    end

    # Choose any available move
    available_moves.sample
  end

  def check_winning_move(board, player)
    # Check rows
    (0..6).step(3) do |i|
      if board[i] == player && board[i] == board[i+1] && board[i] == board[i+2]
        return true
      end
    end

    # Check columns
    3.times do |i|
      if board[i] == player && board[i] == board[i+3] && board[i] == board[i+6]
        return true
      end
    end

    # Check diagonals
    if board[0] == player && board[0] == board[4] && board[0] == board[8]
      return true
    end
    if board[2] == player && board[2] == board[4] && board[2] == board[6]
      return true
    end

    false
  end

  def game_over?
    @game_over
  end

  def winner
    @winner
  end

  def current_player
    @current_player
  end
end

def print_instructions
  puts "Welcome to Tic Tac Toe!"
  puts "Positions are numbered as follows:"
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
  puts "\nEnter the number of the position where you want to place your mark."
  print "Press Enter to continue..."
  gets
end

def main
  print_instructions

  loop do
    game = TicTacToe.new

    # Choose game mode
    print "\nChoose mode:\n1. Player vs Player\n2. Player vs Computer\nEnter choice (1 or 2): "
    mode = gets.chomp

    while !['1', '2'].include?(mode)
      print "Invalid choice! Enter 1 or 2: "
      mode = gets.chomp
    end

    vs_computer = (mode == '2')

    game.print_board

    while !game.game_over?
      if game.current_player == 'X' || !vs_computer
        position = game.get_player_move
      else
        puts "Computer is thinking..."
        position = game.get_computer_move
      end

      if game.make_move(position)
        game.print_board
      end
    end

    # Game over - display result
    if game.winner
      if vs_computer && game.winner == 'O'
        puts "Computer wins! Better luck next time!"
      else
        puts "Player #{game.winner} wins!"
      end
    else
      puts "It's a tie!"
    end

    # Ask to play again
    print "\nPlay again? (y/n): "
    play_again = gets.chomp.downcase
    if play_again != 'y'
      puts "Thanks for playing!"
      break
    end
  end
end

# Start the game
main


# ruby ai/tic-tac-toe.rb
