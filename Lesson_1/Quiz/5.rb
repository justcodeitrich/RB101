# def method(string)
#   words = string.split
#   string_count = []
#   words.map do |word|
#     string_count << word.length
#   end
#   string_count
# end

apple = "The bright red apple grows on the ancient tree"

# #Answer A

# def string_lengths(sentence)
#   strings = sentence.split

#   strings.map { |chars| p chars.length }
# end

#Answer B
def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each { |string| lengths <<  string.size }
  
end

p string_lengths(apple)

#Answer C

# def string_lengths(sentence)
#   words = sentence.split
#   word_lengths = []
#   counter = 0

#   while counter < words.size do
#     word_lengths << words[counter].length
#     counter += 1
#   end

#   word_lengths
# end



#Answer D

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1

#   until counter > strings.size do
#     word_length = strings[counter-1].length
#     lengths.push(word_length)
#     counter += 1
#   end

#   lengths
# end

# p string_lengths(apple)