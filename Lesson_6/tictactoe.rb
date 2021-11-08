require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('tictactoe_yaml.yml')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "#=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ', 'or')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def joinor(array, separator, final_separator)
  return array[0] if array.length == 1
  message = array.join(separator)
  counter = -1
  loop do
    if message[counter] == separator.strip
      message[counter] = " " + final_separator
      break
    else
      counter -= 1
    end
  end
  message
end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals

ACTION_PAIRS = {
  [1, 2] => 3,
  [2, 3] => 1,
  [4, 5] => 6,
  [5, 6] => 4,
  [7, 8] => 9,
  [8, 9] => 7,
  [1, 4] => 7,
  [4, 7] => 1,
  [2, 5] => 8,
  [5, 8] => 2,
  [3, 6] => 9,
  [6, 9] => 3,
  [1, 5] => 9,
  [5, 9] => 1,
  [3, 5] => 7,
  [5, 7] => 3
}

def comp_offense_defense(pairs, brd, sqr)
  if pairs.length > 0 && sqr.nil?
    pairs.keys.each do |pair_value|
      value = ACTION_PAIRS[pair_value]
      return value if empty_squares(brd).include?(value)
    end
  end
  sqr
end

def computer_places_piece!(brd)
  square = nil

  player_pairs = ACTION_PAIRS.select do |line|
    brd.values_at(line[0], line[1]).count(PLAYER_MARKER) == 2
  end

  computer_pairs = ACTION_PAIRS.select do |line|
    brd.values_at(line[0], line[1]).count(COMPUTER_MARKER) == 2
  end
  # I can make a case statement from this
  # OFFENSE first
  square = comp_offense_defense(computer_pairs, brd, square)

  # DEFENSE second
  square = comp_offense_defense(player_pairs, brd, square)

  # Pick 5
  square = pick_square_5(brd, square)

  # Pick randomly
  square = empty_squares(brd).sample if square.nil?

  brd[square] = COMPUTER_MARKER
end

def pick_square_5(brd, sqr)
  if empty_squares(brd).include?(5) && sqr.nil?
    5
  else
    sqr
  end
end

def decide_first_move
  choice = ''
  loop do
    prompt MESSAGES['decide_who_picks_order']
    choice = gets.strip.downcase
    break if choice == 'c' || choice == 'p'
    prompt MESSAGES['invalid_input']
  end
  choice == 'c' ? ['c', 'p'].sample : who_goes_first
end

def who_goes_first
  choice = ''
  loop do
    prompt MESSAGES['who_goes_first?']
    choice = gets.strip.downcase
    break if choice == 'c' || choice == 'p'
    prompt MESSAGES['invalid_input']
  end
  choice
end

def alternate_player(current_player)
  if current_player == 'c'
    'p'
  else
    'c'
  end
end

def place_piece!(brd, current_player)
  if current_player == 'c'
    computer_places_piece!(brd)
  else
    player_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def initialize_scoreboard
  {
    "Player" => 0,
    "Computer" => 0
  }
end

def update_scoreboard(winner, scoreboard)
  scoreboard[winner] += 1 if scoreboard.include?(winner)
end

def won_five_games?(scoreboard)
  scoreboard.values.include?(5)
end

# rubocop: disable Layout/LineLength
def score_prompt(scoreboard)
  prompt(MESSAGES['game_rules'] + " You: #{scoreboard['Player']} | Computer: #{scoreboard['Computer']}")
end

def winner_prompt(board)
  prompt("#{detect_winner(board)} " + MESSAGES['the_winner_is'])
end
# rubocop: enable Layout/LineLength

loop do
  system 'clear'
  scoreboard = initialize_scoreboard

  loop do
    score_prompt(scoreboard)
    current_player = decide_first_move
    system 'clear'
    board = initialize_board

    loop do
      score_prompt(scoreboard)
      prompt "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      system 'clear'
      break if someone_won?(board) || board_full?(board)
    end

    score_prompt(scoreboard)
    prompt "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
    display_board(board)
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    update_scoreboard(detect_winner(board), scoreboard)
    sleep 2
    system 'clear'

    break winner_prompt(board) if won_five_games?(scoreboard)
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
