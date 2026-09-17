class Game 
  XSYMBOL = ' X '
  OSYMBOL = ' O '
  BOARDMAX = 9
  attr_reader :current_turn, :player_one, :player_two

  def initialize(player_one_name,player_two_name)
    @board = Board.new
    @player_one = Player.new(player_one_name, XSYMBOL)
    @player_two = Player.new(player_two_name, OSYMBOL)
    @turn = 1
  end

  def print_game_status
    puts "Turn ##{@turn}: #{@player_one.name}"
    @board.current_board
  end

  def advance_turn
    if @current_turn == @player_one
      @current_turn = @player_two
    else
      @current_turn = @player_one
    end
    @turn += 1
    @current_turn
  end

  def check_slot(row,column)
    if @board.empty_slot(row,column)
      return true
    else
      return false
    end
  end

  def get_player_input
    puts "what row and column would you like to place your symbol (current symbol: #{@current_turn.letter}) (eg. '1,2' for row 1 column 2)"
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
    print "#{current_turn.name}, "
    player_input = get_player_input
    @board.fill(player_input[0],player_input[1], @current_turn)
  end

  def check_win
    @board.check_win
  end

  def check_tie
    if @turn > BOARDMAX
      true
    else 
      false  
    end
  
  end

  def reset_board
    @board.clear
  end

  def play_round
    until check_win || check_tie
      advance_turn
      update_board
      print_game_status
    end
    unless check_tie
      handle_win 
    else
      handle_tie
    end

    puts "Play again? (y/n)"
    if gets.chomp == 'n'
      return false
    else
      gameReset
      return true
    end
  end

  def handle_win
    winner = @current_turn
    puts "#{winner.name} wins!"
    winner.update_score
    print_standings
  end

  def handle_tie
    puts "It was a tie!"
    print_standings
  end

  def print_standings
    puts "Current Standings:"
    puts "#{@player_one.name} wins: #{@player_one.score}"
    puts "#{@player_two.name} wins: #{@player_two.score}"
  end

  def gameReset
    @board.clear
    @current_turn = @player_one
    @turn = 1
    print_game_status
  end

end