class Game 
  attr_accessor :player_one, :player_two
  attr_reader :current_turn

  def initialize()
    @board = board.new
  end

  def print_game_status
    puts "Current Turn: #{@player_one.name}"
    @board.current_board
  end

  def advance_turn
    if @current_turn == @player_one
      @current_turn = @player_two
    else
      @current_turn = @player_one
    end
    @current_turn
  end

  def check_slot(row,column)
    if @board.check_slot(row,column) == ''
      return true
    else
      return false
    end
  end

  def get_player_input
    puts "What row and column would you like to place your symbol (eg. '1,2' for row 1 column 2)"
    player_input = gets.chomp.split(',')
    player_input.map! {|entry| entry.to_i - 1} #subtract 1 to account for 0 indexing
    until check_slot(player_input[0],player_input[1])
      puts "Please re-enter a valid and empty slot!"
      player_input = gets.chomp.split(',')
      player_input.map! {|entry| entry.to_i - 1}
    end
    player_input
  end

  def update_board
    player_input = get_player_input
    @board.fill(player_input[0],player_input[1], @current_turn.letter)
    advance_turn
    @turn_count += 1
  end
end