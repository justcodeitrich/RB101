VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard', 'r','p','sc','sp','l']

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

def abbreviated_choice_converter(choice)
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

score_count = {
  player_score: 0,
  computer_score: 0
  }

loop do
  choice = ''
  
  loop do
    prompt("Choose one option with word or designated letter(s): (r)-rock, (p)-paper, (sc)-scissors, (l)-lizard, (sp)-spock")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  choice = abbreviated_choice_converter(choice)
  computer_choice = abbreviated_choice_converter(VALID_CHOICES.sample)
  system('clear')
  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  result = display_results(choice, computer_choice)
  
  prompt(result)
  
  if result.include?('You')
    score_count[:player_score] += 1
  elsif result.include?('Computer')
    score_count[:computer_score] += 1
  else
  end

  prompt("Your score: #{score_count[:player_score]} | Computer score: #{score_count[:computer_score]}")
  next unless score_count[:player_score] == 3 || score_count[:computer_score] == 3
  system('clear')
  if score_count[:player_score] == 3
    prompt("You won three times! You are the champion!")
  else
    prompt("The computer won three times! Better luck next time!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  
  score_count = {
    player_score: 0,
    computer_score: 0
    }

end

prompt("Thank you for playing. Good bye!")
