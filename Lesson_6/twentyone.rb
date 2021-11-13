SUITS = %w(hearts diamonds clubs spades)
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
MAX_CARD_LIMIT = 21
DEALER_HITS_UNTIL = 17
VALID_YES_NO = ['yes', 'y', 'n', 'no']

MSG = <<HEREDOC
  +------------------------+
    Welcome to Twenty One!
  +------------------------+
HEREDOC

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [value, suit]
    end
  end
  deck
end

def deal_hand(deck)
  hand = []
  card = nil
  2.times do
    card = deck.sample
    hand << card
    remove_card_from_deck!(deck, card)
  end
  hand
end

def say_players_hand(player_cards)
  message = 'Your hand is'
  player_cards.each do |card|
    message.concat(" #{card[0]} of #{card[1]},")
  end
  prompt(message.delete_suffix!(","))
end

def say_players_card_value(player_total)
  prompt "Your cards total value is #{player_total}"
end

# rubocop: disable all
def say_dealers_hand(dealer_cards)
  prompt "The dealer has a #{dealer_cards[0][0]} of #{dealer_cards[0][1]} and an unknown card"
end
# rubocop: enable all

def reveal_dealers_hand(dealer_cards)
  message = "The dealer reveals his hand to show a"
  dealer_cards.each do |card|
    message.concat(" #{card[0]} of #{card[1]},")
  end
  prompt(message.delete_suffix!(","))
end

def say_dealer_hits(new_card)
  prompt "Dealer hits and draws a #{new_card[0]} of #{new_card[1]}"
end

def player_bet(player_chips)
  prompt "You have #{player_chips} chips"
  prompt "You can bet up to #{player_chips} chips. How many do you want to bet?"
  answer = gets.chomp.to_i
  until answer <= player_chips && answer > 0
    prompt "Sorry that's not a valid bet"
    answer = gets.chomp.to_i
  end
  answer
end

def remove_card_from_deck!(deck, new_card)
  deck.delete(new_card)
end

def bust?(total_hand_value)
  total_hand_value > MAX_CARD_LIMIT
end

def ask_hit_or_stay(player_move)
  loop do
    prompt "Do you want to hit or stay?"
    player_move = gets.chomp.downcase
    break if ['hit', 'stay'].include?(player_move)
    prompt "Sorry must type hit or stay"
  end
  player_move
end

def say_new_card(new_card)
  prompt("You drew a #{new_card[0]} of #{new_card[1]}!")
end

def prompt(msg)
  puts "#=> #{msg}"
end

def hit!(deck)
  deck.sample
end

def add_card_to_hand!(new_card, player_cards)
  player_cards << new_card
end

def total_hand_value(hand)
  value = 0
  hand.each do |card|
    value += case card.first
             when 'ace' then ace_value(value)
             when 'jack' then 10
             when 'queen' then 10
             when 'king' then 10
             else card.first
             end
  end
  value
end

def new_card_value(new_card, current_total)
  value = current_total
  value += case new_card.first
           when 'ace' then ace_value(value)
           when 'jack' then 10
           when 'queen' then 10
           when 'king' then 10
           else new_card.first
           end
  value
end

def ace_value(value)
  if (value + 11) > MAX_CARD_LIMIT
    1
  else
    11
  end
end

def announce_winner(player_total, dealer_total)
  if bust?(player_total)
    prompt "You busted with a hand over #{MAX_CARD_LIMIT}! You lose!"
  elsif bust?(dealer_total)
    prompt "Dealer has busted with a hand over #{MAX_CARD_LIMIT}! You win!"
  else
    compare_hand_values(player_total, dealer_total)
  end
end

def compare_hand_values(player_total, dealer_total)
  if player_total > dealer_total
    prompt "You win with a card total of #{player_total}!"
  elsif player_total < dealer_total
    prompt "Dealer wins with a card total of #{dealer_total}!"
  else
    prompt "It's a tie! You and dealer have a card total of #{player_total}!"
  end
end

def play_again?
  prompt "Do you want to play again?"
  choice = gets.strip.downcase
  until VALID_YES_NO.include?(choice)
    prompt "Sorry that's not a valid input."
    choice = gets.strip.downcase
  end
  choice.start_with?('y') ? true : false
end

def bet_result(chips_bet, player_total, dealer_total, player_chips)
  if bust?(player_total)
    player_chips - chips_bet
  elsif bust?(dealer_total)
    player_chips + chips_bet
  elsif player_total > dealer_total
    player_chips + chips_bet
  elsif player_total < dealer_total
    player_chips - chips_bet
  else
    player_chips
  end
end

# gameplay
system 'clear'
puts MSG
player_chips = 10

loop do
  deck = initialize_deck
  player_cards = deal_hand(deck)
  dealer_cards = deal_hand(deck)
  player_total = total_hand_value(player_cards)
  dealer_total = total_hand_value(dealer_cards)
  chips_bet = player_bet(player_chips)
  player_move = ''

  # player loop
  loop do
    system 'clear'
    say_dealers_hand(dealer_cards)
    say_players_hand(player_cards)
    say_players_card_value(player_total)
    sleep 2
    player_move = ask_hit_or_stay(player_move)

    if player_move == 'hit'
      new_card = hit!(deck)
      add_card_to_hand!(new_card, player_cards)
      remove_card_from_deck!(deck, new_card)
      player_total = new_card_value(new_card, player_total)
      say_new_card(new_card)
      sleep 2
      system 'clear'
    elsif player_move == 'stay'
      break
    end
    break if bust?(player_total)
  end

  # dealer loop
  loop do
    break if bust?(player_total)
    system 'clear'
    reveal_dealers_hand(dealer_cards)
    sleep 2
    until dealer_total >= DEALER_HITS_UNTIL
      new_card = hit!(deck)
      add_card_to_hand!(new_card, dealer_cards)
      remove_card_from_deck!(deck, new_card)
      dealer_total = new_card_value(new_card, dealer_total)
      say_dealer_hits(new_card)
      sleep 2
    end
    break
  end

  announce_winner(player_total, dealer_total)
  player_chips = bet_result(chips_bet, player_total, dealer_total, player_chips)
  if player_chips == 0
    prompt "You have no more chips! Better luck next time. Goodbye!"
    break
  end

  break unless play_again?
end
