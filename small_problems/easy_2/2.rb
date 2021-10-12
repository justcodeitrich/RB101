# Main idea: Create a program that tells me the area of a room with the length and width I give it

# Input: 2 integers given by user - (length and width)
# Output: 1 string containing two integers or floats

# Take both a length and width from the user in meters
# Convert them into floats
# Multiply them together to get the square meters
# Convert the resulting square meters into square feet
# Print a string to user that prints both square meters and square feet

def area_calculator
  puts "Hi, please give a length of the room"
  length = gets.chomp
  puts "Next, please give the width of the room"
  width = gets.chomp
  square_meters = (length.to_f * width.to_f)
  square_feet = (square_meters * 10.7639)
  puts "The area of your room is #{square_meters} sq meters. (#{square_feet.round} sq feet)."
end

#FURTHER EXPLORATION - ask for measurement in feet and display results in sq ft, sq inches, and sq cm
SQFT_TO_INCHES = 12
SQFT_TO_CM = 30.48
def area_calculator
  puts "Hi, please give a length of the room in feet"
  length = gets.chomp
  puts "Next, please give the width of the room in feet"
  width = gets.chomp
  square_feet = (length.to_f * width.to_f)
  square_inches = (square_feet * SQFT_TO_INCHES)
  square_cm = (square_feet * SQFT_TO_CM)
  puts "The area of your room is #{square_feet} sq ft. (Equivalent to #{square_inches.round} sq inches or #{square_cm.round} sq cm)."
end