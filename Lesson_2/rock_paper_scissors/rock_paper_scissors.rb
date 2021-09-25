require 'yaml'
MESSAGES = YAML.load_file('text.yml')

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard',
                 'r', 'p', 'sc', 'sp', 'l']
VALID_YES_NO = ['y', 'yes', 'n', 'no']

def prompt(message)
  puts("=> #{message}")
end

def clear_screen
  system('clear')
end

def welcome_player
  clear_screen
  prompt(MESSAGES['welcome'])
  sleep(1)
  prompt(MESSAGES['game_rules'])
  sleep(2)
end

def get_user_selection
  input = ''
  loop do
    prompt(MESSAGES['ask_user_for_selection'])
    input = gets.chomp.downcase.strip
    unless VALID_CHOICES.include?(input)
      prompt(MESSAGES['invalid_choice_error'])
      input = gets.chomp.downcase.strip
    end
    break
  end
  input
end

def win?(p1, p2)
  options = {
    spock: ['rock', 'scissors'],
    lizard: ['spock', 'paper'],
    rock: ['lizard', 'scissors'],
    paper: ['rock', 'spock'],
    scissors: ['lizard', 'paper']
  }
  p1 = p1.to_sym

  options[p1] && (p2.to_s == options[p1][0] || p2.to_s == options[p1][1])
end

def validate_choice(input)
  case input
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  else input
  end
end

def add_score(result, scoreboard)
  if result.include?('You')
    scoreboard[:p1] += 1
  elsif result.include?('Computer')
    scoreboard[:comp] += 1
  end
end

def display_results(player, computer)
  if win?(player, computer)
    "You win!"
  elsif win?(computer, player)
    "Computer wins!"
  else
    "It's a tie!"
  end
end

def declare_winner(scoreboard)
  if scoreboard[:p1] == 3
    prompt(MESSAGES['player_wins'])
  else
    prompt(MESSAGES['computer_wins'])
  end
end

def play_again?
  go_again = gets.chomp.downcase.strip
  until VALID_YES_NO.include?(go_again)
    prompt(MESSAGES['invalid_answer'])
    go_again = gets.chomp.downcase.strip
  end
  go_again[0] == 'y'
end

def next_round?
  until !gets.chomp.nil?
  end
end

loop do
  scoreboard = {
    p1: 0,
    comp: 0
  }

  welcome_player

  loop do
    choice = validate_choice(get_user_selection)
    computer_choice = validate_choice(VALID_CHOICES.sample)
    clear_screen

    prompt("You wisely chose: #{choice}. Computer chose: #{computer_choice}")
    result = display_results(choice, computer_choice)
    prompt(result)
    prompt(MESSAGES['next_round'])
    next_round?
    clear_screen

    add_score(result, scoreboard)
    prompt("Your score: #{scoreboard[:p1]} | Comp score: #{scoreboard[:comp]}")
    next unless scoreboard[:p1] == 3 || scoreboard[:comp] == 3
    clear_screen

    declare_winner(scoreboard)
    prompt(MESSAGES['play_again?'])
    break
  end
  break unless play_again?
end

clear_screen
prompt(MESSAGES['goodbye'])
