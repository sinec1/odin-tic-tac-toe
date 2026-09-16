require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

def get_player_name(playerNumber)
    puts 'Please enter your name'
    name = gets.chomp
    puts "Player #{playerNumber}: #{name}"
    name
end



