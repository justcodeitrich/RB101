require 'pry'

SUITS = %w(hearts diamonds clubs spades)
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']

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

def say_players_card_value(player_value)
  prompt "Your cards total value is #{player_value}"
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
  total_hand_value > 21
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
  if (value + 11) > 21
    1
  else
    11
  end
end

def announce_winner(player_value, dealer_value)
  if bust?(player_value)
    prompt "You busted with a hand over 21!"
  elsif bust?(dealer_value)
    prompt "Dealer has busted with a hand over 21!"
  else
    compare_hand_values(player_value, dealer_value)
  end
end

def compare_hand_values(player_value, dealer_value)
  if player_value > dealer_value
    prompt "You win!"
  elsif player_value < dealer_value
    prompt "Dealer wins!"
  else
    prompt "It's a tie!"
  end
end

# gameplay
loop do
  # system 'clear'
  deck = initialize_deck

  player_cards = deal_hand(deck)
  dealer_cards = deal_hand(deck)
  player_total = total_hand_value(player_cards)
  dealer_total = total_hand_value(dealer_cards)

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

    until dealer_total >= 17
      new_card = hit!(deck)
      add_card_to_hand!(new_card, dealer_cards)
      remove_card_from_deck!(deck, new_card)
      dealer_total = new_card_value(new_card, dealer_total)
      say_dealer_hits(new_card)

    end
    break
  end

  announce_winner(player_total, dealer_total)
  puts "play again?"
  break if gets.chomp.downcase.include?('n')
end
