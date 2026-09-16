class Game 
  attr_accessor :player_one, :player_two, :current_turn

  def initialize()
    @board = board.new
  end

  def print_game_status
    puts "Current Turn: #{player_one.name}"
    board.current_board
  end

  def advance_turn
    if current_turn == player_one
      current_turn = player_two
    else
      current_turn = player_one
    end
    current_turn
  end

  def get_player_input
    puts "What row and column would you like to place your symbol (eg. '1,2' for row 1 column 2)"
    input = gets.chomp.split(',')
  end

  def update_board
    input = get_player_input
    @board.fill(input[0],input[1], @current_turn.letter)
    advance_turn
  end
end