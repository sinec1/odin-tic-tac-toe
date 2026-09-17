require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

def get_player_name(playerNumber)
    puts 'Please enter your name:'
    name = gets.chomp
    if name.size == 0
      puts 'Please enter a non-empty string'
      name = gets.chomp
    end
    puts "Player #{playerNumber}: #{name}"
    name
end

def start_game
  player_one_name = get_player_name(1)
  player_two_name = get_player_name(2)

  current_game = Game.new(player_one_name,player_two_name)
end


game = start_game

game.print_game_status

while game.play_round
end

puts "Thanks for playing!"