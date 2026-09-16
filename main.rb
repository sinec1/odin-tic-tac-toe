def get_player_name(playerNumber)
    puts 'Please enter your name'
    name = gets.chomp
    puts "Player #{playerNumber}: #{name}"
    name
end

def get_player_letter
  puts 'Please choose your symbol (either X or O)'
  letter = gets.chomp
  letter
end

