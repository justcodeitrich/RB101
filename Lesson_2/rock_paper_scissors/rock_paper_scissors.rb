require 'yaml'
MESSAGES = YAML.load_file('text.yml')

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard', 'r','p','sc','sp','l']
VALID_YES_NO = ['y','yes','n','no']

def prompt(message)
  puts("=> #{message}")
end

# spock beats rock & scissors
# lizard beats spock & paper
# rock beats lizard and scissors
# paper beats rock & spock
# scissors beats lizard & paper

def win?(first, second)
  
  win_conditions = {
  spock: ['rock', 'scissors'],
  lizard: ['spock', 'paper'],
  rock: ['lizard', 'scissors'],
  paper: ['rock', 'spock'],
  scissors: ['lizard', 'paper']
}
  first = first.to_sym

  win_conditions[first] && ("#{second}" == win_conditions[first][0] || "#{second}" == win_conditions[first][1])
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

def clear_screen
  system('clear')
end

def validate_choice(choice)
  case 
    when choice == 'r' 
      'rock'
    when choice == 'p' 
      'paper'
    when choice == 'sc'  
      'scissors'
    when choice == 'l'  
      'lizard'
    when choice == 'sp'  
      'spock'
    else choice
  end
end

def add_score(result,score_count)
  if result.include?('You')
    score_count[:player_score] += 1
  elsif result.include?('Computer')
    score_count[:computer_score] += 1
  else
  end
end

def declare_winner(score_count)
  if score_count[:player_score] == 3
    prompt(MESSAGES['player_wins'])
  else
    prompt(MESSAGES['computer_wins'])
  end
end

def welcome_player
  clear_screen
  prompt(MESSAGES['welcome'])
  sleep(2)
  prompt(MESSAGES['game_rules'])
  sleep(2)
end

def play_again?
  go_again = gets.chomp.downcase.strip
  until VALID_YES_NO.include?(go_again)
    prompt(MESSAGES['invalid_answer'])
    go_again = gets.chomp.downcase.strip
  end
  go_again[0] == 'y'
end

score_count = {
  player_score: 0,
  computer_score: 0
  }

welcome_player

loop do
  choice = ''
 
  loop do
    
    prompt(MESSAGES['ask_user_for_selection'])
    choice = gets.chomp.downcase.strip
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt(MESSAGES['invalid_choice_error'])
    end
  end

  choice = validate_choice(choice)
  computer_choice = validate_choice(VALID_CHOICES.sample)

  clear_screen
  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  result = display_results(choice, computer_choice)
  
  prompt(result)
  prompt(MESSAGES['next_round'])

  until gets.chomp != nil
  end

  clear_screen
  add_score(result,score_count)

  prompt("Your score: #{score_count[:player_score]} | Computer score: #{score_count[:computer_score]}")
  
  next unless score_count[:player_score] == 3 || score_count[:computer_score] == 3
  clear_screen

  declare_winner(score_count)

  prompt(MESSAGES['play_again?'])
  break unless play_again?
  
  clear_screen
  score_count = {
    player_score: 0,
    computer_score: 0
    }
end

clear_screen
prompt(MESSAGES['goodbye'])
