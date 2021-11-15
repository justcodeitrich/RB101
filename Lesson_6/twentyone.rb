require 'pry'
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
      deck << {
        suit: suit,
        value: value
      }
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
    message.concat(" #{card[:value]} of #{card[:suit]},")
  end
  prompt(message.delete_suffix!(","))
end

def say_players_card_value(player_total)
  prompt "Your cards total value is #{player_total}"
end

# rubocop: disable all
def say_dealers_hand(dealer_cards)
  prompt "The dealer has a #{dealer_cards[0][:value]} of #{dealer_cards[1][:suit]} and an unknown card"
end
# rubocop: enable all

def reveal_dealers_hand(dealer_cards)
  message = "The dealer reveals his hand to show a"
  dealer_cards.each do |card|
    message.concat(" #{card[:value]} of #{card[:suit]},")
  end
  prompt(message.delete_suffix!(","))
end

def say_dealer_hits(new_card)
  prompt "Dealer hits and draws a #{new_card[0][:value]} of #{new_card[0][:suit]}"
end

def player_bet(player_chips)
  prompt "You have #{player_chips} chips"
  prompt "You can bet up to #{player_chips} chips. How many do you want to bet?"
  answer = gets.chomp
  validate_bet(answer, player_chips)
end

def validate_bet(answer, chips)
  loop do
    if answer.to_i <= chips && answer.to_i > 0 && !answer.to_s.include?('.')
      return answer.to_i
    else
      prompt "Sorry that's not a valid bet"
      answer = gets.chomp
    end
  end
end

def remove_card_from_deck!(deck, new_card)
  deck.delete(new_card)
end

def bust?(total_hand_value)
  total_hand_value > MAX_CARD_LIMIT
end

def ask_hit_or_stay(player_move)
  loop do
    prompt "Do you want to hit or stay? Type h or s."
    player_move = gets.strip.downcase
    break if ['h', 's'].include?(player_move)
    prompt "Sorry must type h for hit or s for stay"
  end
  player_move
end

def say_new_card(new_card)
  prompt("You drew a #{new_card[0][:value]} of #{new_card[0][:suit]}!")
end

def prompt(msg)
  puts "#=> #{msg}"
end

def hit!(deck)
  [deck.sample]
end

def add_card_to_hand!(new_card, player_cards)
  player_cards << new_card[0]
end

def total_hand_value(cards, current_total=0)

  cards.each do |card|
    card_value = card[:value]
    current_total += case card_value
             when 'ace' then ace_value(current_total)
             when 'jack' then 10
             when 'queen' then 10
             when 'king' then 10
             else card[:value]
             end
  end
  current_total
end

# refactor new_card_value to total_hand_value
  # This method will return an integer reflecting the total value of all cards
    # This will be use in the beginning to calculate the player's two cards
    # Also used when new card is added to hand to calculate total new value

def new_card_value(new_card, current_total)
  value = current_total
  value += case new_card[:value]
           when 'ace' then ace_value(value)
           when 'jack' then 10
           when 'queen' then 10
           when 'king' then 10
           else new_card[:value]
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

def display_chip_changes(chips_bet, player_chips, pre_game_chips)
  if pre_game_chips < player_chips
    prompt "You won #{chips_bet} chips!"
  elsif pre_game_chips > player_chips
    prompt "You lost #{chips_bet} chips!"
  else
    prompt "You remained with the same amount of chips"
  end
end

def player_loop(dealer_cards,player_cards,player_total,deck)
  loop do
    system 'clear'
    say_dealers_hand(dealer_cards)
    say_players_hand(player_cards)
    say_players_card_value(player_total)
    sleep 2
    player_move = ask_hit_or_stay(player_move)

    if player_move == 'h'
      new_card = hit!(deck)
      add_card_to_hand!(new_card, player_cards)
      remove_card_from_deck!(deck, new_card)
      player_total = total_hand_value(new_card, player_total)
      say_new_card(new_card)
      sleep 2
      system 'clear'
    elsif player_move == 's'
      break
    end
    break if bust?(player_total)
  end
  player_total
end

# when the player busts, the player_total remains the same. How to mutate the outer player_total thats immutable? 

def dealer_loop(player_total,deck,dealer_cards,dealer_total)
  loop do
    break if bust?(player_total)
    # system 'clear'
    reveal_dealers_hand(dealer_cards)
    sleep 2
    until dealer_total >= DEALER_HITS_UNTIL
      new_card = hit!(deck)
      add_card_to_hand!(new_card, dealer_cards)
      remove_card_from_deck!(deck, new_card)
      dealer_total = total_hand_value(new_card, dealer_total)
      say_dealer_hits(new_card)
      sleep 2
    end
    break
  end
  dealer_total
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
  pre_game_chips = player_chips
  player_move = ''

  # player loop
  player_total = player_loop(dealer_cards,player_cards,player_total,deck)
  
  # dealer loop
  dealer_total = dealer_loop(player_total,deck,dealer_cards,dealer_total)
  
  announce_winner(player_total, dealer_total)
  player_chips = bet_result(chips_bet, player_total, dealer_total, player_chips)
  display_chip_changes(chips_bet, player_chips, pre_game_chips)
  if player_chips == 0
    prompt "You have no more chips! Better luck next time. Goodbye!"
    break
  end

  break unless play_again?
end
