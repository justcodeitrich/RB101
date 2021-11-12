require 'pry'

SUITS = %w(hearts diamonds clubs spades)
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
MAX_CARD_LIMIT = 21
DEALER_HITS_UNTIL = 17

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

def remove_card_from_deck!(deck, new_card)
  deck.delete(new_card)
end

def bust?(total_hand_value)
  total_hand_value > MAX_CARD_LIMIT
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
    prompt "You busted with a hand over 21!"
  elsif bust?(dealer_total)
    prompt "Dealer has busted with a hand over 21!"
  else
    compare_hand_values(player_total, dealer_total)
  end
end

def compare_hand_values(player_total, dealer_total)
  if player_total > dealer_total
    prompt "You win!"
  elsif player_total < dealer_total
    prompt "Dealer wins!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def player_bet(player_chips)
  prompt "You have #{player_chips} chips"
  prompt "How many chips do you want to bet?"
  bet = gets.chomp.to_i
end

def bet_results(chips_bet,player_total,dealer_total,player_chips)
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
player_chips = 10
loop do
  
  deck = initialize_deck

  player_cards = deal_hand(deck)
  dealer_cards = deal_hand(deck)
  player_total = total_hand_value(player_cards)
  dealer_total = total_hand_value(dealer_cards)
  
  chips_bet = player_bet(player_chips)

  # player loop
  loop do
    say_players_hand(player_cards)
    say_players_card_value(player_total)
    say_dealers_hand(dealer_cards)

    prompt "Do you want to hit or stay?"
    answer = gets.chomp.downcase

    if answer == 'hit'
      new_card = hit!(deck)
      add_card_to_hand!(new_card, player_cards)
      remove_card_from_deck!(deck, new_card)
      player_total = new_card_value(new_card, player_total)
      say_new_card(new_card)

    elsif answer == 'stay'
    else
      puts "not a valid answer."
    end
    break if bust?(player_total) || answer == 'stay'
  end

  # dealer loop
  loop do
    break if bust?(player_total)
    reveal_dealers_hand(dealer_cards)

    until dealer_total >= DEALER_HITS_UNTIL
      new_card = hit!(deck)
      add_card_to_hand!(new_card, dealer_cards)
      remove_card_from_deck!(deck, new_card)
      dealer_total = new_card_value(new_card, dealer_total)
      say_dealer_hits(new_card)

    end
    break
  end

  announce_winner(player_total, dealer_total)
  player_chips = bet_results(chips_bet,player_total,dealer_total,player_chips)
  if player_chips == 0
    prompt "You have no more chips! Better luck next time."
    break
  end

  break unless play_again?
end

# bonus feature 4
# Start with 10 chips
# Prompt player to bet an amount
  # If player wins, match the bet amount of chips and add to player
  # If player loses, substract the bet amount from player
  # If player loses everything, say good bye

# Check input for all user inputs