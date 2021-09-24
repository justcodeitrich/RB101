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
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    "***You won!***"
  elsif win?(computer, player)
    "Computer wins!"
  else
    "It's a tie!"
  end
end

# Change prompt to show all available options
# adjust program to accept all available options
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

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  puts display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
