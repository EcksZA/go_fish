require './lib/game'
require './lib/player'

puts "Welcome to the game Go Fish!"
puts "\n"

def main_menu
  @game = Game.new({:name => "Go Fish"})
  puts "Choose a name for the first player:"
  name_1 = gets.chomp
  player_1 = Player.new({:name => name_1})
  @game.add_player(player_1)
  puts "Welcome to the game " + player_1.name + "!"
  # puts "These are your cards:"
  # (player_1.current_deck).each{|card| puts card}
  puts "\n"
  puts "Choose a name for the second player:"
  name_2 = gets.chomp
  player_2 = Player.new({:name => name_2})
  @game.add_player(player_2)
  puts "Welcome to the game " + player_2.name + "! \n"
  # puts "These are your cards:"
  # (player_2.current_deck).each{|card| puts card}

  play_game(player_1)
end

def play_game(player)
  puts "\n"
  puts player.name
  puts "\n"
  puts "These are your cards:"
  (player.current_deck).each{|card| puts card}
  puts "\n"
  puts "Type in the card type (number or face) that you want to go fishing for! Eg. 2 if you have 2S"
  puts "Remember! You must have that (number or face) card in your deck!"
  player_choice = gets.chomp
  puts "\n"
  check_card(player_choice, player)
end

def check_card(choice, player)
  (player.current_deck).each_with_index do |card, index|
    if choice == card.chop
      puts "Do you have any #{choice}'s?"
      compare_cards(card, player)
      break
    elsif index == player.current_deck.length - 1
      puts "You do not have that card! Try again"
      play_game(player)
      break
    end
  end
end

def compare_cards(chosen_card, current_player)
  other_player = @game.toggle(current_player)
  other_player.current_deck.each do |card|
    if chosen_card.chop == card.chop
      take_cards(card, current_player, other_player)
    end
  end
  puts "Go Fish!"
  play_game(other_player)
end

def take_cards(matching_card, current_player, other_player)
  count = 0
  other_player.current_deck.each do |card|
    if card.chop == matching_card.chop
      current_player.current_deck << card
      count += 1
    end
  end
  other_player.current_deck.delete_if {|card| card.chop == matching_card.chop}
  puts "#{current_player.name} took #{count} card(s) from #{other_player.name}!"
  play_game(other_player)
end

main_menu
