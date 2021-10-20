# main idea: Write a method that takes an array of integers 0..19 and returns
# an array of those integers sorted based on the English words alphabetically

# input: an array of integers
# output: an array of integers

# Write a method with 1 parameter
# Create a hash with the number and word equivalents
# Iterate through all of the integers and convert them to words
# I can sort using Array#sort {|a,b| a <=> b}
# Once sorted, iterate again to number equivalent

TO_WORD = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(array)
  words = array.map do |number|
    number = TO_WORD[number]
    end
  words.sort! {|a,b| a <=> b}
  numbers = words.map do |word|
    word = TO_WORD.key(word)
  end
numbers
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
