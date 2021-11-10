require 'pry'
#PEDAC

# UNDERSTAND THE PROBLEM
  # Create a simplified version of blackjack
  # Components
    # RULES
      # Jack, Queen, King - value of 10
      # Ace - Can be 1 or 11 depending on the next card drawn
        # If the player's hand is less than 21, then the ace has a value of 11
        # If the player hits and draws a card that totals all cards to greather than 21, the ace is a 1
          # edge case: multiple aces
            # If a hand totals 16 - 5,A(ace is 11). If hit draws another Ace, 5,A,A - the new ace is 1. Total is 17
            # This rule of aces applies regardless of how many aces are in a hand
      # Dealer - must hit until he holds a value of 17 or higher
      # Bust - If player draws cards over 21, dealer wins. If dealer draws cards over 21, player wins
      # Win outcomes possible: Player wins, dealer wins, or tie

    # CARDS 
      # Game is played with a 52 card deck
        # 4 suits (Hearts,Spades,Clubs,Diamonds)
        # 13 cards (2,3,4,5,6,7,8,9,10,Jack,Queen,King,Ace)

    # GAMEPLAY
      # Dealer and player are dealt two cards, dealer has one card face down (unknown value)
      # Player looks at their cards and has the option to stay or hit
        # If hit, dealer deals one card to player 
        # If stay, player's turn ends and moves to dealer
      # Player can continue to hit until card total is over 21 (bust) OR until they choose to stay
      # Dealer's turn
        # If dealer holds less than 17, he must hit until cards add up to 17 or greater
        # If dealer's cards are equal or greater than 17, he stays
      # Total amounts of each player's hand are calculated.
      # Win condition: The player to get to or as close as possible to 21 wins

# Examples and Test cases
  # From LS twentyone page
    # 1. Initialize deck
    # 2. Deal cards to player and dealer
    # 3. Player turn: hit or stay
    #   - repeat until bust or "stay"
    # 4. If player bust, dealer wins.
    # 5. Dealer turn: hit or stay
    #   - repeat until total >= 17
    # 6. If dealer bust, player wins.
    # 7. Compare cards and declare winner.

# Data Structure
  # Begin with input: Hash containing the cards
  # End with output: A string announcing the winner with total amount

  # 52-deck of cards - array - constant variable
  # Player's hand - array 
  # Dealer's hand - array

# Algorithm
    # 1. Initialize deck
      # Initialize a hash that creates the deck of cards by combining suits and numbers
        # Input: two arrays - 1) suits and 2) numbers
        # output: hash of 52 key value pairs

        # Iterate through each array and push into a deck hash
          # Array#each

    # 2. Deal cards to player and dealer
      # Initialize a "hand" for player and dealer
        # use Array#sample to select a sub-array within the deck
        # once this sub-array(card) has been drawn, remove it from the deck
        

    # 3. Player turn: hit or stay
    #  - repeat until bust or "stay"
      # initialize a method hit!
        #input: deck
        #output: sub-array from deck

      # initialize a method that totals the values of cards selected
        # input: value of player_hand (a nested array)
        # output: integer
      # Initialize a method to determine Ace value throughout the game
        # input: integer representing player's hand total value
        # output: 1 or 11
      # Use a loop
        # prompt user with their hand total
        # prompt user to hit! or stay
          # take response and hit! if hit or break out of loop if stay
        # check to see if bust - if bust, prompt user and skip to end of game

    # 4. If player bust, dealer wins.
      # write a method that checks the value of bust? method and prints who wins
        # input: boolean
        # output: string
          # how to identify who won?

      # create the game loop and place announce_winner at end so if player busts, it breaks out of inner loop
    
    # 5. Dealer turn: hit or stay
    #   - repeat until total >= 17
      # Use a loop
    # 6. If dealer bust, player wins.
    # 7. Compare cards and declare winner.
      # method to check winning condition
      # Play again feature

# Code with Intent

  SUITS = %w[hearts diamonds clubs spades]
  VALUES = [2,3,4,5,6,7,8,9,10,'jack','queen','king','ace']

  def initialize_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << [suit,value]
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
      remove_card_from_deck!(deck,card)
    end
    hand
  end

  def remove_card_from_deck!(deck,new_card)
    deck.delete(new_card)
  end

def bust?(total_hand_value)
  true if total_hand_value > 21
end

def prompt(msg)
  puts "#=> #{msg}"
end

def hit!(deck)
  deck.sample
end

def add_card_to_hand!(new_card,player_cards)
  player_cards << new_card
end

def total_hand_value(hand)
  value = 0
  hand.each do |card|
    case 
      when card.last == 'ace' then value += ace_value(value)
      when card.last == 'jack' then value += 10
      when card.last == 'queen' then value += 10
      when card.last == 'king' then value += 10
      else value += card.last
    end
  end
  value 
end

def new_card_value(new_card,current_total)
  value = current_total
  case 
    when new_card.last == 'ace' then value = ace_value(value)
    when new_card.last == 'jack' then value = 10
    when new_card.last == 'queen' then value = 10
    when new_card.last == 'king' then value = 10
    else value = new_card.last
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

# for the player_value outside the player_sequence method to be mutated, it would need to be
# assigned to the return value of player_value from within this method
# probably better to break it out of this player_sequence

def player_sequence(player_cards,player_value,deck)
  loop do
    prompt "Your hand is #{player_cards}."
    prompt "Your total value is #{player_value}"
    prompt "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    if answer == 'hit'
      new_card = hit!(deck)
      add_card_to_hand!(new_card, player_cards)
      remove_card_from_deck!(deck, new_card)
      player_value += new_card_value(new_card,player_value)
      binding.pry
    elsif answer == 'stay'
      puts "STAY"
      break
    end
    break if bust?(player_value)
  end
  player_value
end

# gameplay
loop do
  deck = initialize_deck

  player_cards = deal_hand(deck)
  dealer_cards = deal_hand(deck)
  player_value = total_hand_value(player_cards)
  dealer_value = total_hand_value(dealer_cards)

  loop do
    prompt "Your hand is #{player_cards}."
    prompt "Your total value is #{player_value}"
    prompt "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    if answer == 'hit'
      new_card = hit!(deck)
      add_card_to_hand!(new_card, player_cards)
      remove_card_from_deck!(deck, new_card)
      player_value += new_card_value(new_card,player_value)
      binding.pry
    elsif answer == 'stay'
      puts "STAY"
      break
    end
    break if bust?(player_value)
  end

  binding.pry
  break if bust?(player_value)

end