# Main point: Create a method that takes one number and returns a string of alternating 1s and 0s 
# String length is determined by the integer given

# Input - integer
# Output - string of 0s and 1s, always starting with 1

# How do I create an alternating 0 and 1 combination?
# Create a method that takes an integer
# Create an inner variable to store the final output
# How do I make it so that if the integer argument given is 3, it outputs 101 and stops there? Make it dynamic instead of static
# Maybe append 0 and 1 to the end of the string depending on the last element? ex. if last character is 0, then add 1. If last character is 1 then add 0

def stringy(integer)
  final_string = ''
  integer.times do |int|
    if final_string.empty?
      final_string << "1"
    elsif
      final_string[final_string.length-1] == "1"
      final_string << "0"
    else
      final_string << "1"
    end
  end
  final_string
end

puts stringy(6) == '101010'

#LS solution

def stringy(size)
  numbers = [] # array to hold final output

  size.times do |index| 
    number = index.even? ? 1 : 0 # If the index variable number is even, then number = 1, if not then number = 0
    numbers << number # append number to the numbers array
  end

  numbers.join # join the elements in the array into a string
end


# Further Exploration
# Add another parameter that defaults to 1. If this input is set to 0, then the output starts with 0 instead of 1

def stringy(integer,starting_num=1)
  final_string = ''
  integer.times do |int|
    if final_string.empty?
      if starting_num == 0 
        final_string << "0"
      else 
        final_string << "1"
      end 
    elsif
      final_string[final_string.length-1] == "1"
      final_string << "0"
    else
      final_string << "1"
    end
  end
  final_string
end

puts stringy(6) == '101010'