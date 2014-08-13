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
  puts "\n"
  puts "Choose a name for the second player:"
  name_2 = gets.chomp
  player_2 = Player.new({:name => name_2})
  @game.add_player(player_2)
  puts "Welcome to the game " + player_2.name + "!"
  puts "\n\n"

  play_game(player_1)
end

def play_game(player)
  if player.current_deck == []
    puts "#{player.name} had no cards left and had to pick a card from the deck!"
    other_player.add_card(@game.card_hold)
    play_game(@game.toggle(player))
  else
    print "SCORE=> #{player.name}    #{player.score} : #{(@game.toggle(player)).score}    #{(@game.toggle(player)).name}"
    puts "\n\n"
    puts player.name
    puts "\n"
    puts "These are your cards:"
    (player.current_deck.sort).each{|card| puts card}
    puts "\n"
    puts "Type in the card type (number or face) that you want to go fishing for! Eg. 2 if you have 2S"
    puts "Remember! You must have that (number or face) card in your deck!"
    player_choice = gets.chomp
    puts "\n"
    check_card(player_choice.upcase, player)
  end
end

def check_card(choice, player)
  (player.current_deck).each_with_index do |card, index|
    if choice == card.chop
      puts "Do you have any #{choice}'s?"
      puts "\n"
      compare_cards(card, player)
      break
    elsif index == player.current_deck.length - 1
      puts "You do not have that card! Try again"
      play_game(player)
      break
    else
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
  puts "\n\n"
  current_player.add_card(@game.card_hold)
  if current_player.current_deck == []
    check_end_game(current_player, other_player)
  end
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
  puts "\n"
  check_end_game(current_player, other_player)
end

def check_end_game(current_player, other_player)
  if current_player.score != 0
    if current_player.current_deck.length == 0 #|| @game.deck.length == 0
      puts "The game is over!"
      if current_player.score > other_player.score
        puts "#{current_player.name} Wins!"
        more_play
      elsif current_player.score < other_player.score
        puts "#{other_player.name} Wins!"
        more_play
      else
        puts "It's a draw!"
        more_play
      end
    else
      puts "#{current_player.name} plays again!"
      play_game(current_player)
    end
  else
    puts "#{current_player.name} plays again!"
    play_game(current_player)
  end
end

def more_play
  puts "\n"
  puts "Do you want to play again?"
  puts "Press 'y' to play or 'n' to exit"
  choice = gets.chomp
  if choice == 'y'
    main_menu
  elsif choice == 'n'
    puts "Thank you for playing Go Fish!"
  else
    puts "Sorry, that is not a valid input. Please try again."
    more_play
  end
  puts "Goodbye!"
end

main_menu
